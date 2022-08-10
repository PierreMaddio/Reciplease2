//
//  MockRecipeService.swift
//  Reciplease2Tests
//
//  Created by Pierre on 08/08/2022.
//

import Foundation
import Alamofire
@testable import Reciplease2

//class RecipeServiceMockSuccess: AlamofireClientRecipesSearchMock {
//    
//    func getRecipes(completion: @escaping (Result<RecipesSearch, AFError>) -> Void) {
//        let recipe = RecipesSearch(hits: [Hit.init(recipe: Recipe(
//            label: "Nutty chicken & lemon spaghetti",
//            image: "https://edamam-product-images.s3.amazonaws.com/web-img/2e3/2e3474ba03e6cc5ee50f2e65ba1d59a7.jpg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjELX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJGMEQCIAjqDpa2DNRpZeYN6Rh99UzBMKOf8Vc2vpXvHvPYXRxHAiADqI1jhQ%2BYWg7GlG2U9Hp%2BFr62gz%2BrODOxqebbSzCJOirSBAgeEAAaDDE4NzAxNzE1MDk4NiIMOeQ4r8y3Bnft%2BXjoKq8E%2FrErn9UJQIkKaXR3cLbm%2FRoXi2ZlZ%2FKvnSh8fWbr7Ms2D2iRrpagzFyUpDXGsqxlsF5y7EW3h3gT8RvnYdKGZXxsjOQ4Lb99ajFkjTPsfzd2jDpJhCbToGb5%2Buql6O8%2FrFyoVCRkHXHYMVvb10xT2lItb%2B0Ri%2FvCpXlNSGGm3t1h3Z8CsR34uVPWi3Fp8U3ENAUW7cc50ZiFYPvmtzGgi8sAyHUCVmfkcaVQf2SuuOs2v5d46JUx%2FGqcPf0EdyXTpILSckr8CFjpqVgUVkwpuJ%2BRiFTDtWI2hMjM2ge9GeBghCXFtSY5hoZzAdP4ct46bDvMIiCnNSsKtZ4nXBme4IEKJhWU0X49Cj6fGbUpa%2FqqLb98PM5UTsk45tpfT%2Bz0U42piRNB2Dfwdle9xk4syPaYHji7XEqw2czhHa1IhsMx4Z6YOZmvL26RGSepFrKuzFHAyTcArtVvTz5uWwVJHD7g7C9nbdIDJh%2Fpup51gsyXo%2FFopcT1XrT6pY6VomyetDpA2snPdlceGyw7tPPo%2F87CbnSRv%2B%2BD8pgurLTr%2BSVDVf8bI5JOzi1nwYrEmI5KDzH4QBmlaAoHw8S2AdNRSRKU8k7OF2cGWQrNUejwMyhErjoO%2FTvTJu12V4JSueb8I1QdLNDURJCeKBMV5XtaAfIDBNHwxlPIYTnNzTDRjX57iv603vUVjNWK0v1SaZFv07g5QwKIjpVDu%2BemWh3l1v8HijfNfd5W%2BnY1s2Z90jC68sWXBjqqAfkZHtIWz%2FLbK8YoLCZBo3sfKESZ5pfp9QqxlIHEW4GTXJbwcRCeddrn0uQEHcs9g5trhuwmtUc4jJtGspxUXeCjeVLHU1gtogiae0w6yn%2F9KLu2GTcV2KV5%2BhBx76UFD%2BgpHkvaoVnsdtHJxEw7g7vdARiHwX6eckN3vi0O2trWyjMV5%2FsmM92M3pCA7aA%2F9dq9Uo5rg58zerD9nIw30x2vKX56BzDTpqwV&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20220808T212041Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFLVD243P6%2F20220808%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=b585a3f068b17b9772bc66ab533549d48e2a0d6ff15554c01ee779f60133bdd0",
//            url: "https://www.bbcgoodfood.com/recipes/nutty-chicken-lemon-spaghetti",
//            yield: 4,
//            ingredientLines: [
//                "4 small boneless and skinless chicken thighs",
//                "2 tbsp olive oil",
//                "80g stale white bread , torn into small pieces",
//                "140ml whole milk",
//                "100g walnuts",
//                "1 large garlic clove",
//                "½ lemon , zested and juiced",
//                "300g spaghetti",
//                "1⁄2 small bunch of parsley , finely chopped",
//                "grated parmesan , to serve (optional)"
//             ],
//            totalTime: 30)
//        )])
//        completion(.success(recipe))
//    }
//    
//}
//
//class RecipeServiceMockFail: AlamofireClientRecipesSearchMock {
//    func getRecipes(completion: @escaping (Result<RecipesSearch, AFError>) -> Void) {
//        completion(.failure(.responseSerializationFailed(reason: .decodingFailed(error: ApiError.decodingFailedBecauseOfModelIsWrong))))
//    }
//}
