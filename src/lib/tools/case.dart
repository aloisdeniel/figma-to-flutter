String toVariableName(String name) {
  name = name.replaceAll(" ", "_");
  return name[0].toLowerCase() + name.substring(1);
}