require 'rails_helper'

describe 'SearchResultsFacade' do
  describe 'instance methods' do
    it '#students' do
      results = SearchResultsFacade.new('Slytherin')
      result = results.students.first
      expect(result.name).to eq("Gormlaith Gaunt")
      expect(result.id).to eq(52)
    end

    it '#total_students' do
      results = SearchResultsFacade.new('Slytherin')
      expect(results.total_students).to eq("22 Students")
    end
  end
end
