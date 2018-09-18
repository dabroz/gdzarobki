module StatsHelper
  TRESHOLD = 10

  def gd_pie_chart(key, job: nil)
    library = {
      legend: {
        position: :bottom,
      },
      plugins: {
        labels: {
          textShadow: true,
          fontColor: '#fff',
        },
      },
    }
    data = Entry.all
    data = data.includes(:job_type).where(job_types: {job: job}) if job
    data = data.group(key).count
    sum = data.values.sum
    data = data.sort_by { |k, _v| k.index }
    data = data.map { |k, v| [k.name, v * 100 / sum] }.to_h
    pie_chart data, library: library
  end

  def gd_bar_chart(job, key, title)
    title = "#{job.name} - #{title}"
    data = Entry.all
    data = data.includes(:job_type).where(job_types: {job: job})
    data = data.group(key).count
    valid_ids = data.select { |_k, v| v >= TRESHOLD }.map { |k, _v| k.id }
    data = Entry.all
    data = data.includes(:job_type).where(job_types: {job: job})
    data = data.where("#{key}_id" => valid_ids)
    data = data.group(key).average(:income)
    data = data.map { |k, v| [k.name, v.round(-2)] }.to_h
    return "#{title}: za mało danych" if data.empty?

    bar_chart data, title: title
  end

  def gd_job_stat(job, stat)
    data = Entry.all
    data = data.includes(:job_type).where(job_types: {job: job})
    STDERR.puts "data #{job} #{stat} -- #{data.count}"
    return 'za mało danych' if data.count < TRESHOLD

    data.send(stat, :income).to_i.round(-2).to_s + ' zł'
  end
end
