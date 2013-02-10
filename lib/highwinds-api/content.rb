module HighwindsAPI
  require 'httparty'
  class Content
    include HTTParty
    # debug_output $stdout # adds HTTP debugging 

    base_uri 'https://striketracker2.highwinds.com/webservices/content/'

    def self.purge_url(url, recursive)
      options = {
      :headers    =>  { 'Content-Type'  => 'application/xml', 
                        'Accept'        => 'application/xml' },
      :basic_auth =>  HighwindsAPI.credentials }
      self.delete("?recursive=#{recursive}&url=#{url}", options)
    end

    def self.purge_path(host_hash, path)
      options = {
      :headers    =>  { 'Content-Type'  => 'application/xml', 
                        'Accept'        => 'application/xml' },
      :basic_auth =>  HighwindsAPI.credentials }
      self.delete("/#{host_hash}/cds/#{path}", options)
    end

  end
end