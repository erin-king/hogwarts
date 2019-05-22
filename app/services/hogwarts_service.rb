class HogwartsService

  def get_students(criteria)
    if criteria == 'Gryffindor'
      get_json("/api/v1/house/1")
    elsif criteria == 'Ravenclaw'
      get_json("/api/v1/house/2")
    elsif criteria == 'Hufflepuff'
      get_json("/api/v1/house/3")
    else criteria
      get_json("/api/v1/house/4")
    end
  end

  # def get_students(criteria)
  #   get_json("/api/v1/house/#{criteria}?")
  # end

  private

  def conn
    Faraday.new('http://hogwarts-as-a-service.herokuapp.com') do |f|
      f.headers['x_api_key'] = ENV['x_api_key']
      f.adapter Faraday.default_adapter
    end
  end

  # def conn
  #   Faraday.new('http://hogwarts-it.herokuapp.com') do |f|
  #     f.params['api_key'] = ENV['api_key']
  #     f.adapter Faraday.default_adapter
  #   end
  # end

  def get_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  # def get_json(url)
  #   response = conn.get(url)
  #   JSON.parse(response.body, symbolize_names: true)[:data][0][:attributes][:students]
  # end
end
