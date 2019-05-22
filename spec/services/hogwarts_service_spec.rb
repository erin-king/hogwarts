require 'rails_helper'

describe 'HogwartsService' do
  describe 'instance methods' do
    it '#gets_students' do
      service = HogwartsService.new
      results = service.get_students('Slytherin')[0]

      expect(results).to have_key(:name)
      expect(results).to have_key(:id)
    end
  end
end
