module StatsHelper
  def       gd_pie_chart(key)
    library = {
      width: 400,
      chartArea: {left: 0, top: 0, right: 0, bottom: 0},
      legend: {position: :right},
    }
    pie_chart Entry.group(key).count.map { |k, v| [k.name, v] }.to_h, library: library
  end
end
