class Area
{
  String strArea;

  Area
  (
    {
      this.strArea
    }
  );

  factory Area.fromJSON(Map<String,dynamic> map)
  {
    return Area
    (
      strArea: map['strArea']
    );
  }
}