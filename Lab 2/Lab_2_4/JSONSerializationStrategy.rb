class JSONSerializationStrategy < SerializationStrategy
  def serialize(students)
    JSON.generate(students)
  end
end
