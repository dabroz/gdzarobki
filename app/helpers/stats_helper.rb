module StatsHelper
  def gd_pie_chart(key)
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
    data = Entry.group(key).count
    sum = data.values.sum
    data = data.sort_by { |k, _v| k.index }
    data = data.map { |k, v| [k.name, v * 100 / sum] }.to_h
    pie_chart data, library: library
  end
end
