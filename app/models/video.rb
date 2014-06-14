# == Schema Information
#
# Table name: videos
#
#  id         :integer          not null, primary key
#  url        :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  title      :string(255)      not null
#  author     :string(255)      not null
#  duration   :string(255)      not null
#  uid        :string(255)      not null
#

class Video < ActiveRecord::Base
	attr_accessible :url, :title, :author, :duration, :uid
	URL_FORMAT = /^.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*).*/i

	validates :url, presence: true, format: URL_FORMAT
	before_create :get_uid

	private

	def get_uid
		uid = url.match(URL_FORMAT)
		self.uid = uid[2] if uid && uid[2]

		if self.uid.to_s.length != 11
			self.errors.add(:url, 'is invalid.')
			false
		elsif Video.where(uid: self.uid).any?
			self.errors.add(:url, 'is not unique.')
			false
		else
			get_additional_info
		end
	end

	def get_additional_info
		begin
			client = ::YouTubeIt::OAuth2Client.new(dev_key: 'AIzaSyBiEWWO8eBumRjHWj7ROtFbepmFb905TgQ')
			video = client.video_by(uid)
			self.title = video.title
			self.duration = parse_duration(video.duration)
			self.author = video.author.name
		rescue
			self.title = '' ; self.duration = '00:00:00' ; self.author = '' ;
		end
	end

	def parse_duration(d)
		hr = (d / 3600).floor
		min = ((d - (hr * 3600)) / 60).floor
		sec = (d - (hr * 3600) - (min * 60)).floor

		hr = '0' + hr.to_s if hr.to_i < 10
		min = '0' + min.to_s if min.to_i < 10
		sec = '0' + sec.to_s if sec.to_i < 10

		hr.to_s + ':' + min.to_s + ':' + sec.to_s
	end

end
