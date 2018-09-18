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
    if job
      data = data.includes(:job_type).where(job_types: {job: job})
    end
    data = data.group(key).count
    sum = data.values.sum
    return "za mało danych" if sum < TRESHOLD
    data = data.sort_by { |k, _v| k.index }
    data = data.map { |k, v| [k.name, v * 100 / sum] }.to_h
    pie_chart data, library: library
  end

  def gd_job_stat(job, stat)
    "1120 zł"
  end
end
