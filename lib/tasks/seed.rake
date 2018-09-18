task seed_data: :environment do
  data = YAML.load_file('data.yml')

  data['jobs'].each_with_index do |job, index|
    job_types = job['types'].each_with_index.map do |job_type, job_type_index|
      JobType.create(name: job_type, index: job_type_index)
    end
    job_data = {
               name:      job['name'],
               job_types: job_types,
               index:     index,
    }
    Job.create(job_data)
  end

  data['cities'].each_with_index do |city, index|
    City.create(name: city, index: index)
  end

  data['contracts'].each_with_index do |contract, index|
    Contract.create(name: contract, index: index)
  end

  data['age'].each_with_index do |age, index|
    Age.create(name: age, index: index)
  end

  data['skill'].each_with_index do |skill, index|
    Skill.create(name: skill, index: index)
  end

  ap data
  ap Job.all
  ap JobType.all
  ap City.all
  ap Contract.all
  ap Age.all
  ap Skill.all
end
