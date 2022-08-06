//
//  DetailRecipeViewController.swift
//  Reciplease2
//
//  Created by Pierre on 24/07/2022.
//

import UIKit

class DetailRecipeViewController: UIViewController {
    
    @IBOutlet weak var titleRecipeLabel: UILabel!
    
    let recipe = Recipe(label: "Chicken Vesuvio",
                        image: "https://edamam-product-images.s3.amazonaws.com/web-img/e42/e42f9119813e890af34c259785ae1cfb-s.jpg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHgaCXVzLWVhc3QtMSJHMEUCIDDnAIZfxF5bOdz%2BJ9Nt%2FmZlbcSypgFZDFYwU4Cv1YzQAiEAtpTnJIPxgMTQ2L5YXiiQ88pMoO4lc9S0A%2F8ciU0GLewq2wQI0f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgwxODcwMTcxNTA5ODYiDOYPtW3XUCbnW%2BshuyqvBAPBWTB5QYytUaoWlf0d40Qv%2BXSLIBCV7XsA4Q8BJZ7ucIrAVXEJM7hOaKLTSZPJwxEJUTnXdXZPd0abFIpvsq%2FhJRPUn2fKpmF4Bw06USUKXCp6CncRgwsZ3Zcw5YtAzWGf6oXqYnKg2k4Z63KgGPjenQr%2FZLb3npauDVZhw4mJ4ENKuzXoARXAnpaJQzgBiveORrCf5cnbxL4%2B0eEnff7%2BqdbYClmCG6qVEqsDRo%2FLO0GW2MsrNUyfKKUHItfbtagvei25rI8uBLe7Se4wwNPBoGru3MzDJICua6ZfQJbrazMy4IRoBubNHrGfxFYtiRxvrW7fW8htmPjenJgEomuGFOFHWrqCi8DHG1SL4mHZWLsKuD8uai92OQKqUH%2BQta7P6RxuBOp5h142zoffP4aBq9gTSZ8MJevigj9Rx8U285G0YrokJsz4%2FaLcJ9sSXhmWDeG9qlgWG%2FfSIBB2w4ioEdQdjeT%2FFaFIbThW82uawSxPk7n42SR2SsUK8FCWkYYA%2B2UMvIFhc6HdmnwyctZvilUMtmZdwJFWj7CH4VhpczfZa6XittePRckIAlsoclnaACUyg0VS0vEdsUWqkHDBiPOt5sxhyDOXxH6sNOO9hz28hmoP7M9A5DBuWIlh2E50ePLfER9aWwXhtpXw4%2B8E6TZFd4suhNnl9uhUlNQee4gVEicaAekeoUp5%2FvD3u9B1PDQ7o5qUL0IQXELQ8%2FzeJqc%2BB4Y00c2TDDTEoIgw07q4lwY6qQEl13puqZnt%2BsStMSMreT68OY8INbOV9DHpAKGnTpJCvIsCNXl8%2BjIK%2FivjLOlSkNPyAcl1SSs0hqfBmHHqPd9WxSWZDBfgfAQL0ELTMtqbCuNCdr2wSoadV%2Fo4XfdTZaJREQyPMw0ygqBypi6bQ%2BlRefeomAodXpHddYY7hsu4R0cLM3PqoCF7CwAHqMEBbEdiBUavJgyL%2FfHrIXk28rrdwLIImY1Zuxp%2F&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20220806T083634Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFAVNTJQ4X%2F20220806%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=6d82a6dd936e425217dee04b7ec4649d041356b04f4aed785ec7311eea793692",
                        url: "http://www.seriouseats.com/recipes/2011/12/chicken-vesuvio-recipe.html",
                        yield: 4,
                        ingredientLines: ["1/2 cup olive oil",
                                          "5 cloves garlic, peeled",
                                          "2 large russet potatoes, peeled and cut into chunks",
                                          "1 3-4 pound chicken, cut into 8 pieces (or 3 pound chicken legs)",
                                          "3/4 cup white wine",
                                          "3/4 cup chicken stock",
                                          "3 tablespoons chopped parsley",
                                          "1 tablespoon dried oregano",
                                          "Salt and pepper",
                                          "1 cup frozen peas, thawed"],
                        totalTime: 60)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleRecipeLabel.text = recipe.label
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
