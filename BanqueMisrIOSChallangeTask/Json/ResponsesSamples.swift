enum ResponsesSample: String {
    case badRequest = """
    {
        "status": "BAD_REQUEST",
        "errorType": "INCORRECT_PARAMS",
        "message": "pageNum is less than 1",
        "moreInfoUrl": "http://developer.edmunds.com"
    }
"""
    case allMakesResponse = """
    {
        "totalNumber": 68,
        "totalPages": 68,
        "results": [
            {
                "id": 200001510,
                "name": "Jeep",
                "niceName": "jeep",
                "adTargetId": "jeep",
                "niceId": "jeep",
                "useInUsed": "Y",
                "useInNew": "Y",
                "useInPreProduction": "Y",
                "useInFuture": "N",
                "attributeGroups": {},
                "models": [
                    {
                        "id": "Jeep_Wagoneer",
                        "name": "Wagoneer",
                        "niceName": "wagoneer",
                        "href": "/api/vehicle/v3/models?id=Jeep_Wagoneer"
                    },
                    {
                        "id": "Jeep_Wrangler_JK",
                        "name": "Wrangler JK",
                        "niceName": "wranglerjk",
                        "href": "/api/vehicle/v3/models?id=Jeep_Wrangler_JK"
                    },
                    {
                        "id": "Jeep_Cherokee",
                        "name": "Cherokee",
                        "niceName": "cherokee",
                        "href": "/api/vehicle/v3/models?id=Jeep_Cherokee"
                    },
                    {
                        "id": "Jeep_Grand_Wagoneer",
                        "name": "Grand Wagoneer",
                        "niceName": "grandwagoneer",
                        "href": "/api/vehicle/v3/models?id=Jeep_Grand_Wagoneer"
                    },
                    {
                        "id": "Jeep_Comanche",
                        "name": "Comanche",
                        "niceName": "comanche",
                        "href": "/api/vehicle/v3/models?id=Jeep_Comanche"
                    },
                    {
                        "id": "Jeep_Commander",
                        "name": "Commander",
                        "niceName": "commander",
                        "href": "/api/vehicle/v3/models?id=Jeep_Commander"
                    },
                    {
                        "id": "Jeep_Grand_Cherokee_L",
                        "name": "Grand Cherokee L",
                        "niceName": "grandcherokeel",
                        "href": "/api/vehicle/v3/models?id=Jeep_Grand_Cherokee_L"
                    },
                    {
                        "id": "Jeep_Grand_Cherokee_4xe",
                        "name": "Grand Cherokee 4xe",
                        "niceName": "grandcherokee4xe",
                        "href": "/api/vehicle/v3/models?id=Jeep_Grand_Cherokee_4xe"
                    },
                    {
                        "id": "Jeep_Liberty",
                        "name": "Liberty",
                        "niceName": "liberty",
                        "href": "/api/vehicle/v3/models?id=Jeep_Liberty"
                    },
                    {
                        "id": "Jeep_Compass",
                        "name": "Compass",
                        "niceName": "compass",
                        "href": "/api/vehicle/v3/models?id=Jeep_Compass"
                    },
                    {
                        "id": "Jeep_Patriot",
                        "name": "Patriot",
                        "niceName": "patriot",
                        "href": "/api/vehicle/v3/models?id=Jeep_Patriot"
                    },
                    {
                        "id": "Jeep_Grand_Cherokee_WK",
                        "name": "Grand Cherokee WK",
                        "niceName": "grandcherokeewk",
                        "href": "/api/vehicle/v3/models?id=Jeep_Grand_Cherokee_WK"
                    },
                    {
                        "id": "Jeep_Grand_Cherokee",
                        "name": "Grand Cherokee",
                        "niceName": "grandcherokee",
                        "href": "/api/vehicle/v3/models?id=Jeep_Grand_Cherokee"
                    },
                    {
                        "id": "Jeep_Wrangler",
                        "name": "Wrangler",
                        "niceName": "wrangler",
                        "href": "/api/vehicle/v3/models?id=Jeep_Wrangler"
                    },
                    {
                        "id": "Jeep_Gladiator",
                        "name": "Gladiator",
                        "niceName": "gladiator",
                        "href": "/api/vehicle/v3/models?id=Jeep_Gladiator"
                    },
                    {
                        "id": "Jeep_Grand_Cherokee_SRT",
                        "name": "Grand Cherokee SRT",
                        "niceName": "grandcherokeesrt",
                        "href": "/api/vehicle/v3/models?id=Jeep_Grand_Cherokee_SRT"
                    },
                    {
                        "id": "Jeep_Renegade",
                        "name": "Renegade",
                        "niceName": "renegade",
                        "href": "/api/vehicle/v3/models?id=Jeep_Renegade"
                    }
                ]
            }
        ]
    }
    """

}
