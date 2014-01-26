class Location < ActiveRecord::Base

  validate :longitude, presence: true
  validate :latitude, presence: true
  validate :valid_longitude?
  validate :valid_latitude?

  def valid_longitude?
    if longitude.abs > 90
      errors.add :longitude, "should be between -90 and 90"
    end
  end

  def valid_latitude?
    if latitude.abs > 90
      errors.add :latitude, "should be between -90 and 90"
    end
  end

  def google_maps_url(zoom = 5)
    "http://maps.google.com/?q=#{longitude},#{latitude}&z=#{zoom}"
  end

  def google_maps_static_image_url(zoom=5)
    "http://maps.googleapis.com/maps/api/staticmap?center=#{longitude},#{latitude}&zoom=#{zoom}&size=600x300&maptype=roadmap&sensor=false"
  end

end
