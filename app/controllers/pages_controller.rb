class PagesController < ApplicationController
  def home
    if current_user
      @scores = Score.where(user: current_user)
    end
  end

  def load_data
    url = 'https://raw.githubusercontent.com/rayriffy/maimai-json/master/maimai.json'
    response = RestClient.get(url)
    song_list = JSON.parse(response)
    @song_list = song_list

    song_list.each do |_, list|
      list.each do |song_data|
        song = Song.find_or_initialize_by(game: 'maimai', en_name: song_data['name']['en'], jp_name: song_data['name']['jp'])
        song.scoring = song_data['level']
        song.image_url = song_data['image_url']
        unless song.versions.include? song_data['version']
          song.versions << song_data['version']
        end
        song.save
      end
    end
  end
end