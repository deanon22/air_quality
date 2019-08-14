class HomeController < ApplicationController
  def index
    require 'net/http'
    require 'json'
    @url = 'http://www.airnowapi.org/aq/observation/zipCode/current/?format=application/json&zipCode=' + @zip_query.to_s + '&distance=25&API_KEY=10527081-FDE1-4CF9-8630-B58F2BEBAED5'
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @output = JSON.parse(@response)

      if @output.empty?
        @myerrormsg = "Please Enter a ZipCode"
      else        
        @final_output = @output
        @myAQI = @final_output[0]['AQI']
        case @myAQI
          when 1..50
            @api_color = "green"
          when 51..100
            @api_color = "yellow"
          when 101..150
            @api_color = "orange"
          when 151..200
            @api_color = "red"
          when 201..300
            @api_color = "purple"
          when 301..500
            @api_color = "maroon"
          else
            @api_color = "pink"
          end
      end
    end
      
    def zipcode
      @zip_query = params[:zipcode]
      if params{:zipcode} == ""
        @zip_query = "Please enter a zipcode"
      else params[:zipcode]
        require 'net/http'
        require 'json'
        require 'date'
        current_time = Time.now                
        @Now = current_time.strftime("%m/%d/%y %l:%M %p")
        @url = 'http://www.airnowapi.org/aq/observation/zipCode/current/?format=application/json&zipCode=' + @zip_query.to_s + '&distance=25&API_KEY=10527081-FDE1-4CF9-8630-B58F2BEBAED5'
        @uri = URI(@url)
        @response = Net::HTTP.get(@uri)
        @output = JSON.parse(@response)
    
          if @output.empty?
            @myerrormsg = "There was an error retrieving data"
          else        
            @final_output = @output
            @myAQI = @final_output[0]['AQI']
          case @myAQI
            when 1..50
              @api_color = "green"
            when 51..100
              @api_color = "yellow"
            when 101..150
              @api_color = "orange"
            when 151..200
              @api_color = "red"
            when 201..300
              @api_color = "purple"
            when 301..500
              @api_color = "maroon"
            else
              @api_color = "pink"
            end
          end
      end      
  end
end