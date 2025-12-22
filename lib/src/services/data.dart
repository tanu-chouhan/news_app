import 'package:newapp/src/model/category_model.dart';
import 'package:newapp/src/utils/app_assets.dart';

List<CategoryModel> getCategories() {
  return [
    CategoryModel(
      categoryName: "Business",
      image: AppAssets.business,

    ),
    CategoryModel(
      categoryName: "Entertainment",
      image: AppAssets.entertainment,

    ),
    CategoryModel(
      categoryName: "General",
      image: AppAssets.general,

    ),
    CategoryModel(
      categoryName: "Health",
      image: AppAssets.health,

    ),
    CategoryModel(
      categoryName: "Sports",
      image: AppAssets.sport,

    ),
  ];
}
