class CATEGORY
{
  String idCategory;
  String strCategory;
  String strCategoryThumb;
  String strCategoryDescription;

  CATEGORY
  (
    {
      this.idCategory,
      this.strCategory,
      this.strCategoryThumb,
      this.strCategoryDescription,
    }
  );

  factory CATEGORY.fromJSON(Map<String,dynamic> map)
  {
    return CATEGORY
    (
      idCategory: map['idCategory'],
      strCategory: map['strCategory'],
      strCategoryThumb: map['strCategoryThumb'],
      strCategoryDescription: map['strCategoryDescription']
    );
  }
}