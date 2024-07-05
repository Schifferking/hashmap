# frozen_string_literal: true

# an implementation of a hashmap data structure
class HashMap
  attr_accessor :buckets, :capacity
  attr_reader :load_factor

  DEFAULT_BUCKET_SIZE = 16
  def initialize
    @buckets = Array.new(DEFAULT_BUCKET_SIZE)
    @capacity = @buckets.length
    @load_factor = 0.75
  end

  def hash(key)
    hash_code = 0
    prime_numer = 31

    key.each_char { |char| hash_code = prime_numer * hash_code + char.ord }

    hash_code
  end

  def set(key, value)
    bucket_index = check_index(key)
    @buckets[bucket_index] = { key => value }
    grow if grow?
  end

  def get(key)
    nil unless has?(key) == false

    bucket_index = check_index(key)

    @buckets[bucket_index]
  end

  def has?(key)
    if keys.include?(key)
      true
    else
      false
    end
  end

  def remove(key)
    nil unless has?(key) == false

    value = get(key)
    bucket_index = check_index(key)

    @buckets[bucket_index] = nil
    value
  end

  def length
    keys.length
  end

  def clear
    keys.each { |key| remove(key) }
  end

  def keys
    not_empty_buckets.map { |bucket| bucket.keys[0] }
  end

  def values
    not_empty_buckets.map { |bucket| bucket.values[0] }
  end

  def entries
    not_empty_buckets.map(&:to_a).flatten 1
  end

  private

  def index(key)
    hash_code = hash(key)
    # hashing by multiplication
    ((hash_code * 0.6180339887) % 1 * @capacity).floor
  end

  def check_index(key)
    bucket_index = index(key)
    raise IndexError if bucket_index.negative? || bucket_index >= @capacity

    bucket_index
  end

  def grow?
    entries_length = entries.length
    result = @capacity * @load_factor
    entries_length > result
  end

  def grow
    old_entries = entries
    @capacity *= 2
    @buckets = Array.new(@capacity)
    old_entries.each { |entry| set(entry[0], entry[1]) }
  end

  def not_empty_buckets
    @buckets.reject(&:nil?)
  end
end
