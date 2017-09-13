class SubjectsController < ApplicationController
  require 'scraping'
  include Scraping
  def index
    get_data = syllabus(11,2017)
    subject = Subject.new(campus_id: get_data[0][0][0], url: get_data[0][0][1], year: get_data[0][0][2], name: get_data[0][0][3], code: get_data[0][0][4], teacher: get_data[0][0][5], department: get_data[0][0][6], classification: get_data[0][0][7], num_of_unit: get_data[0][0][8], grade: get_data[0][0][9], term: get_data[0][0][10], number: get_data[0][0][11], place: get_data[0][0][12], updated: get_data[0][0][13], outline: get_data[0][0][14], placement: get_data[0][0][15], item: get_data[0][0][16], procedure: get_data[0][0][17], goal: get_data[0][0][18], criteria: get_data[0][0][19], preparation: get_data[0][0][20], keyword: get_data[0][0][21], textbook: get_data[0][0][22], reference: get_data[0][0][23], note: get_data[0][0][24], email: get_data[0][0][25])
    subject.save
  end
end
