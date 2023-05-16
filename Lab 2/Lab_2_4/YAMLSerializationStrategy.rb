class YAMLSerializationStrategy < SerializationStrategy
  def serialize(students)
    YAML.dump(students)
  end
end
