import 'package:flutterio/core/locator.dart';
import 'package:flutterio/core/services/requirement_service.dart';
import 'package:flutterio/models/product.dart';
import 'package:flutterio/models/requirement.dart';
import 'package:flutterio/views/investor/requirement_detail.dart';


import 'base_model.dart';

class RequirementModel extends BaseModel {
  final  RequirementService _requirementService = getIt<RequirementService>();


  Stream<List<Requirement>> requirements() {
    return _requirementService.getRequirements().asStream();
  }
  Future<void> openDetailPage(Requirement requirement) async {
    busy = true;
    Product tempProduct = Product();
    print(requirement.products);

    tempProduct.fromMap(requirement.products[0]);
    requirement.products = null;
    requirement.products = tempProduct;

    await navigatorService.navigateTo(RequirementDetail(requirement: requirement));
    busy = false;
  }


 /* Future<List<Requirement>> filterProfiles(String filter) async {
    return (await _chatService.getRequirements())
        .toList();
  }*/
}

