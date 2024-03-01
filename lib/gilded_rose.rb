class GildedRose

  def tick(item_name:, quality:, days_remaining:)
    case item_name
    when 'normal'
      normal_tick(quality, days_remaining)
    when 'Aged Brie'
      brie_tick(quality, days_remaining)
    when 'Sulfuras, Hand of Ragnaros'
      sulfuras_tick
    when 'Backstage passes to a TAFKAL80ETC concert'
      backstage_tick(quality, days_remaining)
    end
  end

  private

  def normal_tick(quality, days_remaining)
    item = Normal.new(@quality, @days_remaining)
    item.tick
  end

  def brie_tick(quality, days_remaining)
    item = Brie.new(@quality, @days_remaining)
    item.tick
  end

  def sulfuras_tick
    # No need to do anything for Sulfuras
  end

  def backstage_tick(quality, days_remaining)
    item = Backstage.new(@quality, @days_remaining)
    item.tick
  end

end

class Normal

  attr_reader :quality, :days_remaining

  def initialize(quality, days_remaining)
    @quality = quality
    @days_remaining = days_remaining
  end

  def tick
    @days_remaining -= 1
    return if @quality == 0

    @quality -= 1
    @quality -= 1 if @days_remaining <= 0
  end
end


class Brie
  attr_reader :quality, :days_remaining

  def initialize(quality, days_remaining)
    @quality = quality
    @days_remaining = days_remaining
  end

  def tick
    @days_remaining -= 1
    return if @quality >= 50
    @quality += 1
    @quality += 1 if @days_remaining <=0 && @quality < 50
  end
end


class Sulfuras
end

class Backstage
  attr_reader :quality, :days_remaining

  def initialize(quality, days_remaining)
    @quality = quality
    @days_remaining = days_remaining
  end

  def tick
    @days_remaining -= 1
    return              if @quality >= 50
    return @quality = 0 if @days_remaining < 0

    @quality += 1
    @quality += 1 if @days_remaining < 10
    @quality +=1 if @days_remaining < 5
  end
end
