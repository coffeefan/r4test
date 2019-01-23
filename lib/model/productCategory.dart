class ProductCategory{
  final String categoryId;
  final String parentCategoryId;
  final String imageRectangular;
  final bool hasSubCategory;
  final int sortKey;
  final List categoryNames;
  final List products;

  ProductCategory({this.categoryId, this.parentCategoryId, this.imageRectangular,
      this.hasSubCategory, this.sortKey, this.categoryNames, this.products});

  factory ProductCategory.fromJson(Map<String, dynamic> json) {
    final List categoryNames=[];
    final List products=[];
    return ProductCategory(
        categoryId: json['categoryid'],
        parentCategoryId: json['parentCategoryId'],
        imageRectangular: json ['imageRectangular'],
        hasSubCategory: json['hasSubCategory'],
        sortKey: json['sortKey'],
        categoryNames:categoryNames,
        products:products
    );
  }

  Map toJson() => {
    "categoryid":categoryId,
    "parentCategoryId":parentCategoryId,
    "imageRectangular":imageRectangular,
    "hasSubCategory":hasSubCategory,
    "sortKey":sortKey,
    "categoryNames":categoryNames,
    "products":products
    };
}

class CategoryName{
  final String languageKuerzel;
  final String name;
  CategoryName({this.languageKuerzel, this.name});

  Map toJson() => {
    "languageKuerzel":languageKuerzel,
    "name":name
  };

}