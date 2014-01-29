class Location < ActiveRecord::Base

  validate :longitude, presence: true
  validate :latitude, presence: true
  validate :valid_longitude?
  validate :valid_latitude?

  MAXLONG = 180
  MAXLATT = 90

  def valid_longitude?
    if longitude.abs > MAXLONG
      errors.add :longitude, "should be between -#{MAXLONG} and #{MAXLATT}"
    end
  end

  def valid_latitude?
    if latitude.abs > MAXLATT
      errors.add :latitude, "should be between -#{MAXLATT} and #{MAXLATT}"
    end
  end

  def google_maps_url(zoom = 5)
    "http://maps.google.com/?q=#{latitude},#{longitude}&z=#{zoom}"
  end

  def google_maps_static_image_url(zoom=5)
    "http://maps.googleapis.com/maps/api/staticmap?center=#{latitude},#{longitude}&zoom=#{zoom}&size=600x300&maptype=roadmap&sensor=false"
  end

end
