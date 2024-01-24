//
//  Strings.swift
//  TorchUI
//
//  Created by Mubashir Mushir on 24/11/2023.
//

import Foundation

public class Strings {
    static let jsonString =
"""
{
    "version": 8,
    "name": "Adrienne Outdoors New",
    "metadata": {
        "mapbox:type": "default",
        "mapbox:origin": "outdoors-v12",
        "mapbox:sdk-support": {
            "js": "3.0.0",
            "android": "11.0.0",
            "ios": "11.0.0"
        },
        "mapbox:autocomposite": true,
        "mapbox:groups": {
            "Transit, transit-labels": {
                "name": "Transit, transit-labels",
                "collapsed": true
            },
            "Administrative boundaries, admin": {
                "name": "Administrative boundaries, admin",
                "collapsed": true
            },
            "Land & water, built": {
                "name": "Land & water, built",
                "collapsed": false
            },
            "Transit, bridges": {"name": "Transit, bridges", "collapsed": true},
            "Buildings, building-labels": {
                "name": "Buildings, building-labels",
                "collapsed": true
            },
            "Transit, surface": {"name": "Transit, surface", "collapsed": true},
            "Land & water, land": {
                "name": "Land & water, land",
                "collapsed": false
            },
            "Road network, bridges": {
                "name": "Road network, bridges",
                "collapsed": true
            },
            "Road network, tunnels": {
                "name": "Road network, tunnels",
                "collapsed": true
            },
            "Road network, road-labels": {
                "name": "Road network, road-labels",
                "collapsed": true
            },
            "Buildings, built": {"name": "Buildings, built", "collapsed": true},
            "Natural features, natural-labels": {
                "name": "Natural features, natural-labels",
                "collapsed": true
            },
            "Road network, surface": {
                "name": "Road network, surface",
                "collapsed": true
            },
            "Walking, cycling, etc., barriers-bridges": {
                "name": "Walking, cycling, etc., barriers-bridges",
                "collapsed": true
            },
            "Place labels, place-labels": {
                "name": "Place labels, place-labels",
                "collapsed": true
            },
            "Point of interest labels, poi-labels": {
                "name": "Point of interest labels, poi-labels",
                "collapsed": false
            },
            "Walking, cycling, etc., tunnels": {
                "name": "Walking, cycling, etc., tunnels",
                "collapsed": true
            },
            "Land & water, terrain-labels": {
                "name": "Land & water, terrain-labels",
                "collapsed": true
            },
            "Walking, cycling, etc., walking-cycling-labels": {
                "name": "Walking, cycling, etc., walking-cycling-labels",
                "collapsed": true
            },
            "Walking, cycling, etc., surface": {
                "name": "Walking, cycling, etc., surface",
                "collapsed": true
            },
            "Transit, built": {"name": "Transit, built", "collapsed": true},
            "Land & water, water": {
                "name": "Land & water, water",
                "collapsed": false
            },
            "Transit, ferry-aerialway-labels": {
                "name": "Transit, ferry-aerialway-labels",
                "collapsed": true
            }
        },
        "mapbox:uiParadigm": "global",
        "mapbox:decompiler": {
            "id": "clp24vtr000bg01rc1ix4933f",
            "componentVersion": "18.0.0",
            "strata": [
                {
                    "id": "outdoors-v12",
                    "order": [
                        ["land-and-water", "land"],
                        ["land-and-water", "water"],
                        ["land-and-water", "built"],
                        ["transit", "built"],
                        ["buildings", "built"],
                        ["walking-cycling", "tunnels"],
                        ["road-network", "tunnels"],
                        ["walking-cycling", "surface"],
                        ["road-network", "surface"],
                        ["transit", "surface"],
                        ["walking-cycling", "barriers-bridges"],
                        ["road-network", "bridges"],
                        ["transit", "bridges"],
                        ["buildings", "extruded"],
                        ["admin-boundaries", "admin"],
                        ["land-and-water", "terrain-labels"],
                        ["buildings", "building-labels"],
                        ["road-network", "road-labels"],
                        ["walking-cycling", "walking-cycling-labels"],
                        ["transit", "ferry-aerialway-labels"],
                        ["natural-features", "natural-labels"],
                        ["point-of-interest-labels", "poi-labels"],
                        ["transit", "transit-labels"],
                        ["place-labels", "place-labels"]
                    ]
                }
            ],
            "overrides": {
                "point-of-interest-labels": {
                    "poi-label": {"layout": {"visibility": "none"}}
                },
                "place-labels": {
                    "settlement-subdivision-label": {
                        "layout": {"visibility": "none"}
                    },
                    "settlement-minor-label": {
                        "layout": {"visibility": "none"}
                    },
                    "settlement-major-label": {
                        "layout": {"visibility": "none"}
                    },
                    "state-label": {"layout": {"visibility": "none"}},
                    "country-label": {"layout": {"visibility": "none"}},
                    "continent-label": {"layout": {"visibility": "none"}}
                },
                "transit": {
                    "ferry-auto": {"layout": {"visibility": "none"}},
                    "aerialway": {"layout": {"visibility": "none"}},
                    "airport-label": {"layout": {"visibility": "none"}},
                    "aeroway-line": {"layout": {"visibility": "none"}},
                    "bridge-rail": {"layout": {"visibility": "none"}},
                    "road-rail-tracks": {"layout": {"visibility": "none"}},
                    "ferry": {"layout": {"visibility": "none"}},
                    "transit-label": {"layout": {"visibility": "none"}},
                    "aeroway-polygon": {"layout": {"visibility": "none"}},
                    "ferry-aerialway-label": {"layout": {"visibility": "none"}},
                    "road-rail": {"layout": {"visibility": "none"}},
                    "bridge-rail-tracks": {"layout": {"visibility": "none"}}
                },
                "walking-cycling": {
                    "road-path-bg": {"layout": {"visibility": "none"}},
                    "tunnel-pedestrian": {"layout": {"visibility": "none"}},
                    "tunnel-steps": {"layout": {"visibility": "none"}},
                    "bridge-path-trail": {"layout": {"visibility": "none"}},
                    "road-path-cycleway-piste": {
                        "layout": {"visibility": "none"}
                    },
                    "tunnel-path-trail": {"layout": {"visibility": "none"}},
                    "bridge-steps": {"layout": {"visibility": "none"}},
                    "gate-fence-hedge": {"layout": {"visibility": "none"}},
                    "road-pedestrian": {"layout": {"visibility": "none"}},
                    "bridge-path-bg": {"layout": {"visibility": "none"}},
                    "bridge-path": {"layout": {"visibility": "none"}},
                    "tunnel-path-cycleway-piste": {
                        "layout": {"visibility": "none"}
                    },
                    "tunnel-path": {"layout": {"visibility": "none"}},
                    "path-pedestrian-label": {"layout": {"visibility": "none"}},
                    "bridge-path-cycleway-piste": {
                        "layout": {"visibility": "none"}
                    },
                    "road-path-trail": {"layout": {"visibility": "none"}},
                    "bridge-steps-bg": {"layout": {"visibility": "none"}},
                    "golf-hole-label": {"layout": {"visibility": "none"}},
                    "road-path": {"layout": {"visibility": "none"}},
                    "gate-label": {"layout": {"visibility": "none"}},
                    "road-pedestrian-case": {"layout": {"visibility": "none"}},
                    "golf-hole-line": {"layout": {"visibility": "none"}},
                    "road-steps-bg": {"layout": {"visibility": "none"}},
                    "road-pedestrian-polygon-pattern": {
                        "layout": {"visibility": "none"}
                    },
                    "road-steps": {"layout": {"visibility": "none"}},
                    "road-pedestrian-polygon-fill": {
                        "layout": {"visibility": "none"}
                    },
                    "bridge-pedestrian-case": {
                        "layout": {"visibility": "none"}
                    },
                    "bridge-pedestrian": {"layout": {"visibility": "none"}}
                },
                "land-and-water": {
                    "contour-line": {"paint": {"line-color": "#b1afaf"}},
                    "national-park_tint-band": {
                        "paint": {"line-color": "#e9f1e4"}
                    },
                    "landcover": {
                        "paint": {
                            "fill-color": [
                                "match",
                                ["get", "class"],
                                "wood",
                                "rgba(212, 240, 199, 0.8)",
                                "scrub",
                                "rgba(225, 243, 216, 0.6)",
                                "crop",
                                "rgba(241, 241, 197, 0.6)",
                                "grass",
                                "rgba(230, 246, 223, 0.6)",
                                "snow",
                                "hsl(205, 45%, 95%)",
                                "#f0f9eb"
                            ]
                        }
                    }
                }
            },
            "components": {
                "road-network": "18.0.0",
                "natural-features": "18.0.0",
                "place-labels": "18.0.0",
                "admin-boundaries": "18.0.0",
                "point-of-interest-labels": "18.0.0",
                "walking-cycling": "18.0.0",
                "transit": "18.0.0",
                "land-and-water": "18.0.0",
                "buildings": "18.0.0"
            },
            "propConfig": {
                "road-network": {
                    "roadsFont": [
                        "Manrope Regular",
                        "Arial Unicode MS Regular"
                    ],
                    "colorRoad": "#edeef2",
                    "iconSaturation": -0.5,
                    "colorRoadLabel": "hsl(0,0%, 0%)",
                    "colorBase": "#f5f5f5",
                    "colorMotorwayTrunk": "hsl(25, 90%, 75%)",
                    "shieldsFont": ["Manrope Bold", "Arial Unicode MS Bold"],
                    "colorPathOutline": "hsl(35, 80%, 48%)",
                    "labelStyle": "Outdoors",
                    "roadMarkings": true,
                    "colorRoadOutline": "#d3d3ca"
                },
                "natural-features": {
                    "poiIconBackground": "Circle",
                    "poiIconScale": 0.8,
                    "colorBase": "#f5f5f5",
                    "colorWater": "#c1ddf1",
                    "colorPoi": "hsl(340, 10%, 50%)",
                    "density": 4,
                    "poiEtcFont": [
                        "Manrope Medium",
                        "Arial Unicode MS Regular"
                    ],
                    "waterLabelsFont": [
                        "Manrope Light",
                        "Arial Unicode MS Regular"
                    ]
                },
                "place-labels": {
                    "countriesFont": [
                        "Manrope Medium",
                        "Arial Unicode MS Regular"
                    ],
                    "continentsFont": [
                        "Manrope Medium",
                        "Arial Unicode MS Regular"
                    ],
                    "colorPlaceLabel": "hsl(230, 29%, 25%)",
                    "statesFont": ["Manrope Bold", "Arial Unicode MS Bold"],
                    "colorBase": "#f5f5f5",
                    "settlementSubdivisionsDensity": 3,
                    "settlementsMinorFont": [
                        "Manrope Regular",
                        "Arial Unicode MS Regular"
                    ],
                    "settlementsMajorFont": [
                        "Manrope Medium",
                        "Arial Unicode MS Regular"
                    ],
                    "settlementSubdivisionsFont": [
                        "Manrope Regular",
                        "Arial Unicode MS Regular"
                    ]
                },
                "admin-boundaries": {
                    "colorBase": "#f5f5f5",
                    "colorAdminBoundary": "hsl(350, 30%, 50%)",
                    "admin0DashPattern": "Dash on zoom"
                },
                "point-of-interest-labels": {
                    "educationDensity": 2,
                    "commercialServicesDensity": 2,
                    "generalDensity": 2,
                    "colorPoiEducation": "hsl(30, 60%, 40%)",
                    "colorPoiFoodAndDrink": "hsl(35, 80%, 50%)",
                    "sportAndLeisureDensity": 4,
                    "artsAndEntertainmentDensity": 2,
                    "poiIconScale": 0.8,
                    "parkLikeDensity": 4,
                    "colorPoi": "hsl(340, 10%, 50%)",
                    "colorPoiParkLike": "#e6f7d9",
                    "foodAndDrinkDensity": 2,
                    "historicDensity": 3,
                    "colorPoiMedical": "#e4a396",
                    "placeLikeDensity": 2,
                    "lodgingDensity": 2,
                    "industrialDensity": 2,
                    "storeLikeDensity": 2,
                    "landmarkDensity": 3,
                    "poiIconBackground": "Circle",
                    "motoristDensity": 3,
                    "colorBase": "#f5f5f5",
                    "buildingDensity": 2,
                    "controlDensityByClass": true,
                    "medicalDensity": 3,
                    "religionDensity": 2,
                    "foodAndDrinkStoresDensity": 3,
                    "poiEtcFont": [
                        "Manrope Medium",
                        "Arial Unicode MS Regular"
                    ],
                    "colorPoiSportAndLeisure": "hsl(210, 60%, 50%)",
                    "publicFacilitiesDensity": 2,
                    "visitorAmenitiesDensity": 4
                },
                "walking-cycling": {
                    "walkingPathDashPattern": "Short dash",
                    "roadsFont": [
                        "Manrope Regular",
                        "Arial Unicode MS Regular"
                    ],
                    "controlDashStyle": true,
                    "colorRoad": "#edeef2",
                    "colorGreenspace": "rgba(245, 250, 245, 0.41)",
                    "colorPoi": "hsl(340, 10%, 50%)",
                    "colorPoiParkLike": "#e6f7d9",
                    "colorRoadLabel": "hsl(0,0%, 0%)",
                    "colorBase": "#f5f5f5",
                    "gatesFencesHedges": true,
                    "trailDashPattern": "Long dash",
                    "poiEtcFont": [
                        "Manrope Medium",
                        "Arial Unicode MS Regular"
                    ],
                    "colorPathOutline": "hsl(35, 80%, 48%)",
                    "cyclewayPisteDashPattern": "Solid",
                    "colorRoadOutline": "#d3d3ca"
                },
                "transit": {
                    "roadsFont": [
                        "Manrope Regular",
                        "Arial Unicode MS Regular"
                    ],
                    "poiIconScale": 0.8,
                    "colorPoi": "hsl(340, 10%, 50%)",
                    "colorAirport": "hsl(230, 40%, 55%)",
                    "iconSaturation": -0.5,
                    "colorTransit": "hsl(230, 50%, 60%)",
                    "poiIconBackground": "Rectangle",
                    "colorBase": "#f5f5f5",
                    "colorWater": "#c1ddf1",
                    "poiEtcFont": [
                        "Manrope Medium",
                        "Arial Unicode MS Regular"
                    ],
                    "colorRoadOutline": "#d3d3ca"
                },
                "land-and-water": {
                    "hillshadeStyle": "Outdoors",
                    "colorEducation": "hsl(40, 45%, 78%)",
                    "landStyle": "Outdoors",
                    "colorGreenspace": "rgba(245, 250, 245, 0.41)",
                    "colorPoi": "hsl(340, 10%, 50%)",
                    "colorPoiParkLike": "#e6f7d9",
                    "colorAirport": "hsl(230, 40%, 55%)",
                    "colorIndustrialArea": "hsl(230, 20%, 85%)",
                    "colorMedical": "hsl(20, 45%, 82%)",
                    "transitionLandOnZoom": false,
                    "colorBase": "#f5f5f5",
                    "colorWater": "#c1ddf1",
                    "contours": true,
                    "poiEtcFont": [
                        "Manrope Medium",
                        "Arial Unicode MS Regular"
                    ],
                    "colorCommercialArea": "hsl(55, 45%, 85%)",
                    "bathymetry": true
                },
                "buildings": {
                    "colorBase": "#f5f5f5",
                    "colorBuilding": "#cdcbcb",
                    "houseNumbersFont": [
                        "Manrope Light",
                        "Arial Unicode MS Regular"
                    ]
                }
            }
        }
    },
    "center": [-121.09318215496319, 38.75577705984932],
    "zoom": 15.319068266937817,
    "bearing": 0,
    "pitch": 0,
    "fog": {
        "range": [1, 20],
        "color": [
            "interpolate",
            ["linear"],
            ["zoom"],
            4,
            "hsl(200, 100%, 100%)",
            6,
            "hsl(200, 50%, 90%)"
        ],
        "high-color": [
            "interpolate",
            ["linear"],
            ["zoom"],
            4,
            "hsl(200, 100%, 60%)",
            6,
            "hsl(310, 60%, 80%)"
        ],
        "space-color": [
            "interpolate",
            ["exponential", 1.2],
            ["zoom"],
            4,
            "hsl(205, 10%, 10%)",
            6,
            "hsl(205, 60%, 50%)"
        ],
        "horizon-blend": [
            "interpolate",
            ["exponential", 1.2],
            ["zoom"],
            4,
            0.01,
            6,
            0.1
        ],
        "star-intensity": [
            "interpolate",
            ["exponential", 1.2],
            ["zoom"],
            4,
            0.1,
            6,
            0
        ]
    },
    "sources": {
        "composite": {
            "url": "mapbox://mapbox.mapbox-streets-v8,mapbox.mapbox-terrain-v2,mapbox.mapbox-bathymetry-v2",
            "type": "vector"
        }
    },
    "sprite": "mapbox://sprites/vtremsin/clp24vtr000bg01rc1ix4933f/7h4mso3bscweo4ccr459ueobn",
    "glyphs": "mapbox://fonts/mapbox/{fontstack}/{range}.pbf",
    "projection": {"name": "globe"},
    "layers": [
        {
            "id": "land",
            "type": "background",
            "metadata": {
                "mapbox:featureComponent": "land-and-water",
                "mapbox:group": "Land & water, land"
            },
            "layout": {},
            "paint": {"background-color": "#f5f5f5"}
        },
        {
            "id": "landcover",
            "type": "fill",
            "metadata": {
                "mapbox:featureComponent": "land-and-water",
                "mapbox:group": "Land & water, land"
            },
            "source": "composite",
            "source-layer": "landcover",
            "maxzoom": 12,
            "layout": {},
            "paint": {
                "fill-color": [
                    "match",
                    ["get", "class"],
                    "wood",
                    "rgba(212, 240, 199, 0.8)",
                    "scrub",
                    "rgba(225, 243, 216, 0.6)",
                    "crop",
                    "rgba(241, 241, 197, 0.6)",
                    "grass",
                    "rgba(230, 246, 223, 0.6)",
                    "snow",
                    "hsl(205, 45%, 95%)",
                    "#f0f9eb"
                ],
                "fill-opacity": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    8,
                    0.8,
                    12,
                    0
                ],
                "fill-antialias": false
            }
        },
        {
            "id": "national-park",
            "type": "fill",
            "metadata": {
                "mapbox:featureComponent": "land-and-water",
                "mapbox:group": "Land & water, land"
            },
            "source": "composite",
            "source-layer": "landuse_overlay",
            "minzoom": 5,
            "filter": ["==", ["get", "class"], "national_park"],
            "layout": {},
            "paint": {
                "fill-color": "rgba(240, 245, 240, 0.41)",
                "fill-opacity": [
                    "interpolate",
                    ["linear"],
                    ["zoom"],
                    5,
                    0,
                    6,
                    0.6,
                    12,
                    0.2
                ]
            }
        },
        {
            "id": "national-park_tint-band",
            "type": "line",
            "metadata": {
                "mapbox:featureComponent": "land-and-water",
                "mapbox:group": "Land & water, land"
            },
            "source": "composite",
            "source-layer": "landuse_overlay",
            "minzoom": 9,
            "filter": ["==", ["get", "class"], "national_park"],
            "layout": {},
            "paint": {
                "line-color": "#e9f1e4",
                "line-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    9,
                    1,
                    14,
                    8
                ],
                "line-blur": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    9,
                    1,
                    14,
                    8
                ]
            }
        },
        {
            "id": "landuse",
            "type": "fill",
            "metadata": {
                "mapbox:featureComponent": "land-and-water",
                "mapbox:group": "Land & water, land"
            },
            "source": "composite",
            "source-layer": "landuse",
            "minzoom": 5,
            "filter": [
                "all",
                [">=", ["to-number", ["get", "sizerank"]], 0],
                [
                    "match",
                    ["get", "class"],
                    [
                        "agriculture",
                        "wood",
                        "grass",
                        "scrub",
                        "glacier",
                        "pitch",
                        "sand"
                    ],
                    ["step", ["zoom"], false, 11, true],
                    "residential",
                    ["step", ["zoom"], true, 10, false],
                    ["park", "airport"],
                    [
                        "step",
                        ["zoom"],
                        false,
                        8,
                        ["case", ["==", ["get", "sizerank"], 1], true, false],
                        10,
                        true
                    ],
                    ["facility", "industrial"],
                    ["step", ["zoom"], false, 12, true],
                    "rock",
                    ["step", ["zoom"], false, 11, true],
                    "cemetery",
                    ["step", ["zoom"], false, 11, true],
                    "school",
                    ["step", ["zoom"], false, 11, true],
                    "hospital",
                    ["step", ["zoom"], false, 11, true],
                    "commercial_area",
                    ["step", ["zoom"], false, 11, true],
                    false
                ],
                [
                    "<=",
                    [
                        "-",
                        ["to-number", ["get", "sizerank"]],
                        [
                            "interpolate",
                            ["exponential", 1.5],
                            ["zoom"],
                            12,
                            0,
                            18,
                            14
                        ]
                    ],
                    14
                ]
            ],
            "layout": {},
            "paint": {
                "fill-color": [
                    "interpolate",
                    ["linear"],
                    ["zoom"],
                    15,
                    [
                        "match",
                        ["get", "class"],
                        "wood",
                        "rgba(173, 214, 173, 0.20999999999999996)",
                        "scrub",
                        "rgba(206, 222, 206, 0.009999999999999953)",
                        "agriculture",
                        "rgba(220, 238, 220, 0.009999999999999953)",
                        "park",
                        [
                            "match",
                            ["get", "type"],
                            ["garden", "playground", "zoo"],
                            "rgba(240, 245, 240, 0.41)",
                            "rgba(245, 250, 245, 0.41)"
                        ],
                        "grass",
                        "rgba(220, 238, 220, 0.009999999999999953)",
                        "airport",
                        "hsl(230, 40%, 93%)",
                        "cemetery",
                        "rgba(255, 255, 255, 0.41)",
                        "glacier",
                        "rgb(230, 237, 243)",
                        "hospital",
                        "hsl(20, 45%, 82%)",
                        "pitch",
                        "rgba(255, 255, 255, 0.41)",
                        "sand",
                        "rgba(236, 212, 212, 0.9704999999999999)",
                        "rock",
                        "rgb(255, 255, 255)",
                        "school",
                        "hsl(40, 45%, 78%)",
                        "commercial_area",
                        "hsl(55, 45%, 85%)",
                        "residential",
                        "rgb(250, 250, 250)",
                        ["facility", "industrial"],
                        "hsl(230, 20%, 85%)",
                        "rgb(226, 226, 226)"
                    ],
                    16,
                    [
                        "match",
                        ["get", "class"],
                        "wood",
                        "rgba(173, 214, 173, 0.20999999999999996)",
                        "scrub",
                        "rgba(206, 222, 206, 0.009999999999999953)",
                        "agriculture",
                        "rgba(220, 238, 220, 0.009999999999999953)",
                        "park",
                        [
                            "match",
                            ["get", "type"],
                            ["garden", "playground", "zoo"],
                            "rgba(240, 245, 240, 0.41)",
                            "rgba(245, 250, 245, 0.41)"
                        ],
                        "grass",
                        "rgba(220, 238, 220, 0.009999999999999953)",
                        "airport",
                        "hsl(230, 40%, 93%)",
                        "cemetery",
                        "rgba(255, 255, 255, 0.41)",
                        "glacier",
                        "rgb(230, 237, 243)",
                        "hospital",
                        "hsl(20, 45%, 82%)",
                        "pitch",
                        "rgba(255, 255, 255, 0.41)",
                        "sand",
                        "rgba(236, 212, 212, 0.9704999999999999)",
                        "rock",
                        "rgba(255, 255, 255, 0.5)",
                        "school",
                        "hsl(40, 45%, 78%)",
                        "commercial_area",
                        "hsla(55, 45%, 85%, 0.5)",
                        ["facility", "industrial"],
                        "hsl(230, 20%, 85%)",
                        "rgb(226, 226, 226)"
                    ]
                ],
                "fill-opacity": [
                    "interpolate",
                    ["linear"],
                    ["zoom"],
                    8,
                    ["match", ["get", "class"], "residential", 0.8, 0.2],
                    10,
                    ["match", ["get", "class"], "residential", 0, 1]
                ],
                "fill-antialias": false
            }
        },
        {
            "id": "hillshade",
            "type": "fill",
            "metadata": {
                "mapbox:featureComponent": "land-and-water",
                "mapbox:group": "Land & water, land"
            },
            "source": "composite",
            "source-layer": "hillshade",
            "maxzoom": 16,
            "filter": [
                "all",
                [
                    "step",
                    ["zoom"],
                    ["==", ["get", "class"], "shadow"],
                    11,
                    true
                ],
                [
                    "match",
                    ["get", "level"],
                    89,
                    true,
                    78,
                    ["step", ["zoom"], false, 5, true],
                    67,
                    ["step", ["zoom"], false, 9, true],
                    56,
                    ["step", ["zoom"], false, 6, true],
                    94,
                    ["step", ["zoom"], false, 11, true],
                    90,
                    ["step", ["zoom"], false, 12, true],
                    false
                ]
            ],
            "layout": {},
            "paint": {
                "fill-color": [
                    "interpolate",
                    ["linear"],
                    ["zoom"],
                    14,
                    [
                        "match",
                        ["get", "class"],
                        "shadow",
                        "rgba(67, 45, 45, 0.08)",
                        "rgba(255, 255, 255, 0.14)"
                    ],
                    16,
                    [
                        "match",
                        ["get", "class"],
                        "shadow",
                        "rgba(67, 45, 45, 0)",
                        "rgba(255, 255, 255, 0)"
                    ]
                ],
                "fill-antialias": false
            }
        },
        {
            "id": "contour-line",
            "type": "line",
            "metadata": {
                "mapbox:featureComponent": "land-and-water",
                "mapbox:group": "Land & water, land"
            },
            "source": "composite",
            "source-layer": "contour",
            "minzoom": 11,
            "filter": ["!=", ["get", "index"], -1],
            "layout": {},
            "paint": {
                "line-opacity": [
                    "interpolate",
                    ["linear"],
                    ["zoom"],
                    11,
                    ["match", ["get", "index"], [1, 2], 0.15, 0.3],
                    13,
                    ["match", ["get", "index"], [1, 2], 0.3, 0.5]
                ],
                "line-color": "#b1afaf",
                "line-width": [
                    "interpolate",
                    ["linear"],
                    ["zoom"],
                    13,
                    ["match", ["get", "index"], [1, 2], 0.5, 0.6],
                    16,
                    ["match", ["get", "index"], [1, 2], 0.8, 1.2]
                ]
            }
        },
        {
            "id": "cliff",
            "type": "line",
            "metadata": {
                "mapbox:featureComponent": "land-and-water",
                "mapbox:group": "Land & water, land"
            },
            "source": "composite",
            "source-layer": "structure",
            "minzoom": 15,
            "filter": ["==", ["get", "class"], "cliff"],
            "layout": {"line-cap": "round", "line-join": "round"},
            "paint": {
                "line-opacity": [
                    "interpolate",
                    ["linear"],
                    ["zoom"],
                    15,
                    0,
                    15.25,
                    1
                ],
                "line-width": 10,
                "line-pattern": "cliff"
            }
        },
        {
            "id": "pitch-outline",
            "type": "line",
            "metadata": {
                "mapbox:featureComponent": "land-and-water",
                "mapbox:group": "Land & water, land"
            },
            "source": "composite",
            "source-layer": "landuse",
            "minzoom": 15,
            "filter": ["==", ["get", "class"], "pitch"],
            "layout": {},
            "paint": {"line-color": "rgba(231, 242, 228, 0.41)"}
        },
        {
            "id": "waterway-shadow",
            "type": "line",
            "metadata": {
                "mapbox:featureComponent": "land-and-water",
                "mapbox:group": "Land & water, water"
            },
            "source": "composite",
            "source-layer": "waterway",
            "minzoom": 10,
            "layout": {
                "line-cap": ["step", ["zoom"], "butt", 11, "round"],
                "line-join": ["step", ["zoom"], "miter", 11, "round"]
            },
            "paint": {
                "line-color": "rgb(187, 202, 242)",
                "line-width": [
                    "interpolate",
                    ["exponential", 1.3],
                    ["zoom"],
                    9,
                    ["match", ["get", "class"], ["canal", "river"], 0.1, 0],
                    20,
                    ["match", ["get", "class"], ["canal", "river"], 8, 3]
                ],
                "line-translate": [
                    "interpolate",
                    ["exponential", 1.2],
                    ["zoom"],
                    7,
                    ["literal", [0, 0]],
                    16,
                    ["literal", [-1, -1]]
                ],
                "line-translate-anchor": "viewport",
                "line-opacity": [
                    "interpolate",
                    ["linear"],
                    ["zoom"],
                    8,
                    0,
                    8.5,
                    1
                ]
            }
        },
        {
            "id": "water-shadow",
            "type": "fill",
            "metadata": {
                "mapbox:featureComponent": "land-and-water",
                "mapbox:group": "Land & water, water"
            },
            "source": "composite",
            "source-layer": "water",
            "minzoom": 10,
            "layout": {},
            "paint": {
                "fill-color": "rgb(187, 202, 242)",
                "fill-translate": [
                    "interpolate",
                    ["exponential", 1.2],
                    ["zoom"],
                    7,
                    ["literal", [0, 0]],
                    16,
                    ["literal", [-1, -1]]
                ],
                "fill-translate-anchor": "viewport"
            }
        },
        {
            "id": "waterway",
            "type": "line",
            "metadata": {
                "mapbox:featureComponent": "land-and-water",
                "mapbox:group": "Land & water, water"
            },
            "source": "composite",
            "source-layer": "waterway",
            "minzoom": 8,
            "layout": {
                "line-cap": ["step", ["zoom"], "butt", 11, "round"],
                "line-join": ["step", ["zoom"], "miter", 11, "round"]
            },
            "paint": {
                "line-color": "#c1ddf1",
                "line-width": [
                    "interpolate",
                    ["exponential", 1.3],
                    ["zoom"],
                    9,
                    ["match", ["get", "class"], ["canal", "river"], 0.1, 0],
                    20,
                    ["match", ["get", "class"], ["canal", "river"], 8, 3]
                ],
                "line-opacity": [
                    "interpolate",
                    ["linear"],
                    ["zoom"],
                    8,
                    0,
                    8.5,
                    1
                ]
            }
        },
        {
            "id": "water",
            "type": "fill",
            "metadata": {
                "mapbox:featureComponent": "land-and-water",
                "mapbox:group": "Land & water, water"
            },
            "source": "composite",
            "source-layer": "water",
            "layout": {},
            "paint": {"fill-color": "#c1ddf1"}
        },
        {
            "id": "water-depth",
            "type": "fill",
            "metadata": {
                "mapbox:featureComponent": "land-and-water",
                "mapbox:group": "Land & water, water"
            },
            "source": "composite",
            "source-layer": "depth",
            "maxzoom": 8,
            "layout": {},
            "paint": {
                "fill-antialias": false,
                "fill-color": [
                    "interpolate",
                    ["linear"],
                    ["zoom"],
                    6,
                    [
                        "interpolate",
                        ["linear"],
                        ["get", "min_depth"],
                        0,
                        "rgba(193, 221, 241, 0.35)",
                        200,
                        "rgba(158, 202, 233, 0.35)",
                        7000,
                        "rgba(122, 182, 225, 0.35)"
                    ],
                    8,
                    [
                        "interpolate",
                        ["linear"],
                        ["get", "min_depth"],
                        0,
                        "rgba(193, 221, 241, 0)",
                        200,
                        "rgba(158, 202, 233, 0)",
                        7000,
                        "rgba(104, 172, 221, 0)"
                    ]
                ]
            }
        },
        {
            "id": "wetland",
            "type": "fill",
            "metadata": {
                "mapbox:featureComponent": "land-and-water",
                "mapbox:group": "Land & water, water"
            },
            "source": "composite",
            "source-layer": "landuse_overlay",
            "minzoom": 5,
            "filter": [
                "match",
                ["get", "class"],
                ["wetland", "wetland_noveg"],
                true,
                false
            ],
            "paint": {
                "fill-color": "rgb(220, 231, 235)",
                "fill-opacity": [
                    "interpolate",
                    ["linear"],
                    ["zoom"],
                    10,
                    0.25,
                    10.5,
                    0.15
                ]
            }
        },
        {
            "id": "wetland-pattern",
            "type": "fill",
            "metadata": {
                "mapbox:featureComponent": "land-and-water",
                "mapbox:group": "Land & water, water"
            },
            "source": "composite",
            "source-layer": "landuse_overlay",
            "minzoom": 5,
            "filter": [
                "match",
                ["get", "class"],
                ["wetland", "wetland_noveg"],
                true,
                false
            ],
            "paint": {
                "fill-color": "rgb(220, 231, 235)",
                "fill-opacity": [
                    "interpolate",
                    ["linear"],
                    ["zoom"],
                    10,
                    0,
                    10.5,
                    1
                ],
                "fill-pattern": "wetland",
                "fill-translate-anchor": "viewport"
            }
        },
        {
            "id": "land-structure-polygon",
            "type": "fill",
            "metadata": {
                "mapbox:featureComponent": "land-and-water",
                "mapbox:group": "Land & water, built"
            },
            "source": "composite",
            "source-layer": "structure",
            "minzoom": 13,
            "filter": [
                "all",
                ["==", ["get", "class"], "land"],
                ["==", ["geometry-type"], "Polygon"]
            ],
            "layout": {},
            "paint": {"fill-color": "#f5f5f5"}
        },
        {
            "id": "land-structure-line",
            "type": "line",
            "metadata": {
                "mapbox:featureComponent": "land-and-water",
                "mapbox:group": "Land & water, built"
            },
            "source": "composite",
            "source-layer": "structure",
            "minzoom": 13,
            "filter": [
                "all",
                ["==", ["get", "class"], "land"],
                ["==", ["geometry-type"], "LineString"]
            ],
            "layout": {"line-cap": "square"},
            "paint": {
                "line-width": [
                    "interpolate",
                    ["exponential", 1.99],
                    ["zoom"],
                    14,
                    0.75,
                    20,
                    40
                ],
                "line-color": "#f5f5f5"
            }
        },
        {
            "id": "aeroway-polygon",
            "type": "fill",
            "metadata": {
                "mapbox:featureComponent": "transit",
                "mapbox:group": "Transit, built"
            },
            "source": "composite",
            "source-layer": "aeroway",
            "minzoom": 11,
            "filter": [
                "all",
                [
                    "match",
                    ["get", "type"],
                    ["runway", "taxiway", "helipad"],
                    true,
                    false
                ],
                ["==", ["geometry-type"], "Polygon"]
            ],
            "layout": {"visibility": "none"},
            "paint": {
                "fill-color": "hsl(230, 32%, 89%)",
                "fill-opacity": [
                    "interpolate",
                    ["linear"],
                    ["zoom"],
                    10,
                    0,
                    11,
                    1
                ]
            }
        },
        {
            "id": "aeroway-line",
            "type": "line",
            "metadata": {
                "mapbox:featureComponent": "transit",
                "mapbox:group": "Transit, built"
            },
            "source": "composite",
            "source-layer": "aeroway",
            "minzoom": 9,
            "filter": ["==", ["geometry-type"], "LineString"],
            "layout": {"visibility": "none"},
            "paint": {
                "line-color": "hsl(230, 32%, 89%)",
                "line-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    9,
                    ["match", ["get", "type"], "runway", 1, 0.5],
                    18,
                    ["match", ["get", "type"], "runway", 80, 20]
                ],
                "line-opacity": [
                    "interpolate",
                    ["linear"],
                    ["zoom"],
                    10,
                    0,
                    11,
                    1
                ]
            }
        },
        {
            "id": "building",
            "type": "fill",
            "metadata": {
                "mapbox:featureComponent": "buildings",
                "mapbox:group": "Buildings, built"
            },
            "source": "composite",
            "source-layer": "building",
            "minzoom": 15,
            "filter": [
                "all",
                ["!=", ["get", "type"], "building:part"],
                ["==", ["get", "underground"], "false"]
            ],
            "layout": {},
            "paint": {
                "fill-color": "#cdcbcb",
                "fill-opacity": [
                    "interpolate",
                    ["linear"],
                    ["zoom"],
                    15,
                    0,
                    16,
                    1
                ],
                "fill-outline-color": "rgba(188, 188, 188, 0.8)"
            }
        },
        {
            "id": "tunnel-path-trail",
            "type": "line",
            "metadata": {
                "mapbox:featureComponent": "walking-cycling",
                "mapbox:group": "Walking, cycling, etc., tunnels"
            },
            "source": "composite",
            "source-layer": "road",
            "minzoom": 15,
            "filter": [
                "all",
                ["==", ["get", "structure"], "tunnel"],
                ["==", ["get", "class"], "path"],
                [
                    "match",
                    ["get", "type"],
                    ["hiking", "mountain_bike", "trail"],
                    true,
                    false
                ],
                ["==", ["geometry-type"], "LineString"]
            ],
            "layout": {"visibility": "none"},
            "paint": {
                "line-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    15,
                    1,
                    18,
                    4
                ],
                "line-color": "rgb(230, 224, 224)",
                "line-dasharray": [
                    "step",
                    ["zoom"],
                    ["literal", [5, 0.5]],
                    15,
                    ["literal", [4, 0.5]],
                    16,
                    ["literal", [4, 0.45]]
                ]
            }
        },
        {
            "id": "tunnel-path-cycleway-piste",
            "type": "line",
            "metadata": {
                "mapbox:featureComponent": "walking-cycling",
                "mapbox:group": "Walking, cycling, etc., tunnels"
            },
            "source": "composite",
            "source-layer": "road",
            "minzoom": 12,
            "filter": [
                "all",
                ["==", ["get", "structure"], "tunnel"],
                ["==", ["get", "class"], "path"],
                ["match", ["get", "type"], ["cycleway", "piste"], true, false],
                ["==", ["geometry-type"], "LineString"]
            ],
            "layout": {"visibility": "none"},
            "paint": {
                "line-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    15,
                    1,
                    18,
                    4
                ],
                "line-color": "rgb(230, 224, 224)",
                "line-dasharray": [10, 0]
            }
        },
        {
            "id": "tunnel-path",
            "type": "line",
            "metadata": {
                "mapbox:featureComponent": "walking-cycling",
                "mapbox:group": "Walking, cycling, etc., tunnels"
            },
            "source": "composite",
            "source-layer": "road",
            "minzoom": 15,
            "filter": [
                "all",
                ["==", ["get", "structure"], "tunnel"],
                ["==", ["get", "class"], "path"],
                ["!=", ["get", "type"], "steps"],
                ["==", ["geometry-type"], "LineString"]
            ],
            "layout": {"visibility": "none"},
            "paint": {
                "line-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    15,
                    1,
                    18,
                    4
                ],
                "line-color": "rgb(230, 224, 224)",
                "line-dasharray": [
                    "step",
                    ["zoom"],
                    ["literal", [1, 0]],
                    15,
                    ["literal", [1.75, 1]],
                    16,
                    ["literal", [1, 0.75]],
                    17,
                    ["literal", [1, 0.5]]
                ]
            }
        },
        {
            "id": "tunnel-steps",
            "type": "line",
            "metadata": {
                "mapbox:featureComponent": "walking-cycling",
                "mapbox:group": "Walking, cycling, etc., tunnels"
            },
            "source": "composite",
            "source-layer": "road",
            "minzoom": 15,
            "filter": [
                "all",
                ["==", ["get", "structure"], "tunnel"],
                ["==", ["get", "type"], "steps"],
                ["==", ["geometry-type"], "LineString"]
            ],
            "layout": {"visibility": "none"},
            "paint": {
                "line-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    15,
                    1,
                    16,
                    1.6,
                    18,
                    6
                ],
                "line-color": "rgb(230, 224, 224)",
                "line-dasharray": [
                    "step",
                    ["zoom"],
                    ["literal", [1, 0]],
                    15,
                    ["literal", [1.75, 1]],
                    16,
                    ["literal", [1, 0.75]],
                    17,
                    ["literal", [0.3, 0.3]]
                ]
            }
        },
        {
            "id": "tunnel-pedestrian",
            "type": "line",
            "metadata": {
                "mapbox:featureComponent": "walking-cycling",
                "mapbox:group": "Walking, cycling, etc., tunnels"
            },
            "source": "composite",
            "source-layer": "road",
            "minzoom": 15,
            "filter": [
                "all",
                ["==", ["get", "structure"], "tunnel"],
                ["==", ["get", "class"], "pedestrian"],
                ["==", ["geometry-type"], "LineString"]
            ],
            "layout": {"visibility": "none"},
            "paint": {
                "line-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    14,
                    0.5,
                    18,
                    12
                ],
                "line-color": "#edeef2",
                "line-dasharray": [
                    "step",
                    ["zoom"],
                    ["literal", [2, 0.3]],
                    15,
                    ["literal", [1, 0.3]],
                    16,
                    ["literal", [1, 0.3]],
                    17,
                    ["literal", [1, 0.25]]
                ]
            }
        },
        {
            "id": "tunnel-minor-case",
            "type": "line",
            "metadata": {
                "mapbox:featureComponent": "road-network",
                "mapbox:group": "Road network, tunnels"
            },
            "source": "composite",
            "source-layer": "road",
            "minzoom": 13,
            "filter": [
                "all",
                ["==", ["get", "structure"], "tunnel"],
                [
                    "match",
                    ["get", "class"],
                    ["track"],
                    true,
                    "service",
                    ["step", ["zoom"], false, 14, true],
                    false
                ],
                ["==", ["geometry-type"], "LineString"]
            ],
            "paint": {
                "line-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    14,
                    0.8,
                    22,
                    2
                ],
                "line-color": "rgb(176, 176, 171)",
                "line-gap-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    14,
                    1,
                    18,
                    10,
                    22,
                    100
                ],
                "line-dasharray": [3, 3]
            }
        },
        {
            "id": "tunnel-street-case",
            "type": "line",
            "metadata": {
                "mapbox:featureComponent": "road-network",
                "mapbox:group": "Road network, tunnels"
            },
            "source": "composite",
            "source-layer": "road",
            "minzoom": 14,
            "filter": [
                "all",
                ["==", ["get", "structure"], "tunnel"],
                [
                    "match",
                    ["get", "class"],
                    ["street", "street_limited"],
                    true,
                    false
                ],
                ["==", ["geometry-type"], "LineString"]
            ],
            "paint": {
                "line-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    14,
                    0.8,
                    22,
                    2
                ],
                "line-color": "rgb(176, 176, 171)",
                "line-gap-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    12,
                    0.5,
                    18,
                    20,
                    22,
                    200
                ],
                "line-opacity": ["step", ["zoom"], 0, 14, 1],
                "line-dasharray": [3, 3]
            }
        },
        {
            "id": "tunnel-minor-link-case",
            "type": "line",
            "metadata": {
                "mapbox:featureComponent": "road-network",
                "mapbox:group": "Road network, tunnels"
            },
            "source": "composite",
            "source-layer": "road",
            "minzoom": 13,
            "filter": [
                "all",
                [
                    "match",
                    ["get", "class"],
                    ["primary_link", "secondary_link", "tertiary_link"],
                    true,
                    false
                ],
                ["==", ["get", "structure"], "tunnel"],
                ["==", ["geometry-type"], "LineString"]
            ],
            "layout": {
                "line-cap": ["step", ["zoom"], "butt", 14, "round"],
                "line-join": ["step", ["zoom"], "miter", 14, "round"]
            },
            "paint": {
                "line-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    14,
                    0.8,
                    22,
                    2
                ],
                "line-color": "#d3d3ca",
                "line-gap-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    12,
                    0.4,
                    18,
                    18,
                    22,
                    180
                ],
                "line-opacity": ["step", ["zoom"], 0, 11, 1]
            }
        },
        {
            "id": "tunnel-secondary-tertiary-case",
            "type": "line",
            "metadata": {
                "mapbox:featureComponent": "road-network",
                "mapbox:group": "Road network, tunnels"
            },
            "source": "composite",
            "source-layer": "road",
            "minzoom": 11,
            "filter": [
                "all",
                ["==", ["get", "structure"], "tunnel"],
                [
                    "match",
                    ["get", "class"],
                    ["secondary", "tertiary"],
                    true,
                    false
                ],
                ["==", ["geometry-type"], "LineString"]
            ],
            "paint": {
                "line-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    14,
                    1,
                    22,
                    2
                ],
                "line-color": "rgb(176, 176, 171)",
                "line-gap-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    3,
                    0,
                    18,
                    26,
                    22,
                    260
                ],
                "line-dasharray": [3, 3]
            }
        },
        {
            "id": "tunnel-primary-case",
            "type": "line",
            "metadata": {
                "mapbox:featureComponent": "road-network",
                "mapbox:group": "Road network, tunnels"
            },
            "source": "composite",
            "source-layer": "road",
            "minzoom": 10,
            "filter": [
                "all",
                ["==", ["get", "structure"], "tunnel"],
                ["==", ["get", "class"], "primary"],
                ["==", ["geometry-type"], "LineString"]
            ],
            "paint": {
                "line-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    14,
                    1,
                    22,
                    2
                ],
                "line-color": "rgb(176, 176, 171)",
                "line-gap-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    3,
                    0.8,
                    18,
                    28,
                    22,
                    280
                ],
                "line-dasharray": [3, 3]
            }
        },
        {
            "id": "tunnel-major-link-case",
            "type": "line",
            "metadata": {
                "mapbox:featureComponent": "road-network",
                "mapbox:group": "Road network, tunnels"
            },
            "source": "composite",
            "source-layer": "road",
            "minzoom": 12,
            "filter": [
                "all",
                ["==", ["get", "structure"], "tunnel"],
                [
                    "match",
                    ["get", "class"],
                    ["motorway_link", "trunk_link"],
                    true,
                    false
                ],
                ["==", ["geometry-type"], "LineString"]
            ],
            "paint": {
                "line-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    14,
                    0.8,
                    22,
                    2
                ],
                "line-color": "#edeef2",
                "line-gap-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    12,
                    0.8,
                    18,
                    20,
                    22,
                    200
                ],
                "line-dasharray": [3, 3]
            }
        },
        {
            "id": "tunnel-motorway-trunk-case",
            "type": "line",
            "metadata": {
                "mapbox:featureComponent": "road-network",
                "mapbox:group": "Road network, tunnels"
            },
            "source": "composite",
            "source-layer": "road",
            "minzoom": 13,
            "filter": [
                "all",
                ["==", ["get", "structure"], "tunnel"],
                ["match", ["get", "class"], ["motorway", "trunk"], true, false],
                ["==", ["geometry-type"], "LineString"]
            ],
            "paint": {
                "line-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    14,
                    1,
                    22,
                    2
                ],
                "line-color": "rgb(239, 239, 235)",
                "line-gap-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    3,
                    0.8,
                    18,
                    30,
                    22,
                    300
                ],
                "line-dasharray": [3, 3]
            }
        },
        {
            "id": "tunnel-construction",
            "type": "line",
            "metadata": {
                "mapbox:featureComponent": "road-network",
                "mapbox:group": "Road network, tunnels"
            },
            "source": "composite",
            "source-layer": "road",
            "minzoom": 14,
            "filter": [
                "all",
                ["==", ["get", "structure"], "tunnel"],
                ["==", ["get", "class"], "construction"],
                ["==", ["geometry-type"], "LineString"]
            ],
            "paint": {
                "line-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    14,
                    2,
                    18,
                    20,
                    22,
                    200
                ],
                "line-color": "#d3d3ca",
                "line-dasharray": [
                    "step",
                    ["zoom"],
                    ["literal", [0.4, 0.8]],
                    15,
                    ["literal", [0.3, 0.6]],
                    16,
                    ["literal", [0.2, 0.3]],
                    17,
                    ["literal", [0.2, 0.25]],
                    18,
                    ["literal", [0.15, 0.15]]
                ]
            }
        },
        {
            "id": "tunnel-minor",
            "type": "line",
            "metadata": {
                "mapbox:featureComponent": "road-network",
                "mapbox:group": "Road network, tunnels"
            },
            "source": "composite",
            "source-layer": "road",
            "minzoom": 13,
            "filter": [
                "all",
                ["==", ["get", "structure"], "tunnel"],
                [
                    "match",
                    ["get", "class"],
                    ["track"],
                    true,
                    "service",
                    ["step", ["zoom"], false, 14, true],
                    false
                ],
                ["==", ["geometry-type"], "LineString"]
            ],
            "paint": {
                "line-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    14,
                    1,
                    18,
                    10,
                    22,
                    100
                ],
                "line-color": [
                    "match",
                    ["get", "class"],
                    "street_limited",
                    "rgb(244, 244, 244)",
                    "#edeef2"
                ]
            }
        },
        {
            "id": "tunnel-minor-link",
            "type": "line",
            "metadata": {
                "mapbox:featureComponent": "road-network",
                "mapbox:group": "Road network, tunnels"
            },
            "source": "composite",
            "source-layer": "road",
            "minzoom": 13,
            "filter": [
                "all",
                [
                    "match",
                    ["get", "class"],
                    ["primary_link", "secondary_link", "tertiary_link"],
                    true,
                    false
                ],
                ["==", ["get", "structure"], "tunnel"],
                ["==", ["geometry-type"], "LineString"]
            ],
            "layout": {
                "line-cap": ["step", ["zoom"], "butt", 13, "round"],
                "line-join": ["step", ["zoom"], "miter", 13, "round"]
            },
            "paint": {
                "line-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    12,
                    0.4,
                    18,
                    18,
                    22,
                    180
                ],
                "line-color": "#edeef2"
            }
        },
        {
            "id": "tunnel-major-link",
            "type": "line",
            "metadata": {
                "mapbox:featureComponent": "road-network",
                "mapbox:group": "Road network, tunnels"
            },
            "source": "composite",
            "source-layer": "road",
            "minzoom": 12,
            "filter": [
                "all",
                ["==", ["get", "structure"], "tunnel"],
                [
                    "match",
                    ["get", "class"],
                    ["motorway_link", "trunk_link"],
                    true,
                    false
                ],
                ["==", ["geometry-type"], "LineString"]
            ],
            "paint": {
                "line-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    12,
                    0.8,
                    18,
                    20,
                    22,
                    200
                ],
                "line-color": [
                    "match",
                    ["get", "class"],
                    "motorway_link",
                    "hsl(15, 100%, 85%)",
                    "hsl(35, 78%, 85%)"
                ]
            }
        },
        {
            "id": "tunnel-street",
            "type": "line",
            "metadata": {
                "mapbox:featureComponent": "road-network",
                "mapbox:group": "Road network, tunnels"
            },
            "source": "composite",
            "source-layer": "road",
            "minzoom": 13,
            "filter": [
                "all",
                ["==", ["get", "structure"], "tunnel"],
                [
                    "match",
                    ["get", "class"],
                    ["street", "street_limited"],
                    true,
                    false
                ],
                ["==", ["geometry-type"], "LineString"]
            ],
            "paint": {
                "line-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    12,
                    0.5,
                    18,
                    20,
                    22,
                    200
                ],
                "line-color": [
                    "match",
                    ["get", "class"],
                    "street_limited",
                    "rgb(244, 244, 244)",
                    "#edeef2"
                ],
                "line-opacity": ["step", ["zoom"], 0, 14, 1]
            }
        },
        {
            "id": "tunnel-street-low",
            "type": "line",
            "metadata": {
                "mapbox:featureComponent": "road-network",
                "mapbox:group": "Road network, tunnels"
            },
            "source": "composite",
            "source-layer": "road",
            "minzoom": 13,
            "maxzoom": 14,
            "filter": [
                "all",
                ["==", ["get", "structure"], "tunnel"],
                [
                    "match",
                    ["get", "class"],
                    ["street", "street_limited"],
                    true,
                    false
                ],
                ["==", ["geometry-type"], "LineString"]
            ],
            "layout": {
                "line-cap": ["step", ["zoom"], "butt", 14, "round"],
                "line-join": ["step", ["zoom"], "miter", 14, "round"]
            },
            "paint": {
                "line-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    12,
                    0.5,
                    18,
                    20,
                    22,
                    200
                ],
                "line-color": "#edeef2"
            }
        },
        {
            "id": "tunnel-secondary-tertiary",
            "type": "line",
            "metadata": {
                "mapbox:featureComponent": "road-network",
                "mapbox:group": "Road network, tunnels"
            },
            "source": "composite",
            "source-layer": "road",
            "minzoom": 13,
            "filter": [
                "all",
                ["==", ["get", "structure"], "tunnel"],
                [
                    "match",
                    ["get", "class"],
                    ["secondary", "tertiary"],
                    true,
                    false
                ],
                ["==", ["geometry-type"], "LineString"]
            ],
            "paint": {
                "line-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    3,
                    0,
                    18,
                    26,
                    22,
                    260
                ],
                "line-color": "#edeef2"
            }
        },
        {
            "id": "tunnel-primary",
            "type": "line",
            "metadata": {
                "mapbox:featureComponent": "road-network",
                "mapbox:group": "Road network, tunnels"
            },
            "source": "composite",
            "source-layer": "road",
            "minzoom": 13,
            "filter": [
                "all",
                ["==", ["get", "structure"], "tunnel"],
                ["==", ["get", "class"], "primary"],
                ["==", ["geometry-type"], "LineString"]
            ],
            "paint": {
                "line-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    3,
                    0.8,
                    18,
                    28,
                    22,
                    280
                ],
                "line-color": "#edeef2"
            }
        },
        {
            "id": "tunnel-motorway-trunk",
            "type": "line",
            "metadata": {
                "mapbox:featureComponent": "road-network",
                "mapbox:group": "Road network, tunnels"
            },
            "source": "composite",
            "source-layer": "road",
            "minzoom": 13,
            "filter": [
                "all",
                ["==", ["get", "structure"], "tunnel"],
                ["match", ["get", "class"], ["motorway", "trunk"], true, false],
                ["==", ["geometry-type"], "LineString"]
            ],
            "paint": {
                "line-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    3,
                    0.8,
                    18,
                    30,
                    22,
                    300
                ],
                "line-color": [
                    "match",
                    ["get", "class"],
                    "motorway",
                    "hsl(15, 100%, 85%)",
                    "hsl(35, 78%, 85%)"
                ]
            }
        },
        {
            "id": "tunnel-oneway-arrow-blue",
            "type": "symbol",
            "metadata": {
                "mapbox:featureComponent": "road-network",
                "mapbox:group": "Road network, tunnels"
            },
            "source": "composite",
            "source-layer": "road",
            "minzoom": 16,
            "filter": [
                "all",
                ["==", ["get", "structure"], "tunnel"],
                ["==", ["get", "oneway"], "true"],
                [
                    "step",
                    ["zoom"],
                    [
                        "match",
                        ["get", "class"],
                        [
                            "primary",
                            "secondary",
                            "street",
                            "street_limited",
                            "tertiary"
                        ],
                        true,
                        false
                    ],
                    16,
                    [
                        "match",
                        ["get", "class"],
                        [
                            "primary",
                            "secondary",
                            "tertiary",
                            "street",
                            "street_limited",
                            "primary_link",
                            "secondary_link",
                            "tertiary_link",
                            "service",
                            "track"
                        ],
                        true,
                        false
                    ]
                ],
                [
                    "step",
                    ["pitch"],
                    true,
                    50,
                    ["<", ["distance-from-center"], 1],
                    60,
                    ["<", ["distance-from-center"], 1.5],
                    70,
                    ["<", ["distance-from-center"], 2]
                ]
            ],
            "layout": {
                "symbol-placement": "line",
                "icon-image": [
                    "step",
                    ["zoom"],
                    "oneway-small",
                    18,
                    "oneway-large"
                ],
                "symbol-spacing": 200,
                "icon-rotation-alignment": "map",
                "icon-allow-overlap": true,
                "icon-ignore-placement": true
            },
            "paint": {}
        },
        {
            "id": "tunnel-oneway-arrow-white",
            "type": "symbol",
            "metadata": {
                "mapbox:featureComponent": "road-network",
                "mapbox:group": "Road network, tunnels"
            },
            "source": "composite",
            "source-layer": "road",
            "minzoom": 16,
            "filter": [
                "all",
                ["==", ["get", "structure"], "tunnel"],
                [
                    "match",
                    ["get", "class"],
                    ["motorway", "motorway_link", "trunk", "trunk_link"],
                    true,
                    false
                ],
                ["==", ["get", "oneway"], "true"],
                [
                    "step",
                    ["pitch"],
                    true,
                    50,
                    ["<", ["distance-from-center"], 1],
                    60,
                    ["<", ["distance-from-center"], 1.5],
                    70,
                    ["<", ["distance-from-center"], 2]
                ]
            ],
            "layout": {
                "symbol-placement": "line",
                "icon-image": [
                    "step",
                    ["zoom"],
                    "oneway-white-small",
                    18,
                    "oneway-white-large"
                ],
                "symbol-spacing": 200,
                "icon-rotation-alignment": "map",
                "icon-allow-overlap": true,
                "icon-ignore-placement": true
            },
            "paint": {}
        },
        {
            "id": "road-pedestrian-polygon-fill",
            "type": "fill",
            "metadata": {
                "mapbox:featureComponent": "walking-cycling",
                "mapbox:group": "Walking, cycling, etc., surface"
            },
            "source": "composite",
            "source-layer": "road",
            "minzoom": 14,
            "filter": [
                "all",
                [
                    "match",
                    ["get", "class"],
                    ["path", "pedestrian"],
                    true,
                    false
                ],
                ["match", ["get", "structure"], ["none", "ford"], true, false],
                ["case", ["has", "layer"], [">=", ["get", "layer"], 0], true],
                ["==", ["geometry-type"], "Polygon"]
            ],
            "layout": {"visibility": "none"},
            "paint": {"fill-color": "#f5f5f5"}
        },
        {
            "id": "road-pedestrian-polygon-pattern",
            "type": "fill",
            "metadata": {
                "mapbox:featureComponent": "walking-cycling",
                "mapbox:group": "Walking, cycling, etc., surface"
            },
            "source": "composite",
            "source-layer": "road",
            "minzoom": 16,
            "filter": [
                "all",
                [
                    "match",
                    ["get", "class"],
                    ["path", "pedestrian"],
                    true,
                    false
                ],
                ["match", ["get", "structure"], ["none", "ford"], true, false],
                ["case", ["has", "layer"], [">=", ["get", "layer"], 0], true],
                ["==", ["geometry-type"], "Polygon"]
            ],
            "layout": {"visibility": "none"},
            "paint": {
                "fill-pattern": "pedestrian-polygon",
                "fill-opacity": [
                    "interpolate",
                    ["linear"],
                    ["zoom"],
                    16,
                    0,
                    17,
                    1
                ]
            }
        },
        {
            "id": "road-path-bg",
            "type": "line",
            "metadata": {
                "mapbox:featureComponent": "walking-cycling",
                "mapbox:group": "Walking, cycling, etc., surface"
            },
            "source": "composite",
            "source-layer": "road",
            "minzoom": 12,
            "filter": [
                "all",
                ["==", ["get", "class"], "path"],
                [
                    "step",
                    ["zoom"],
                    [
                        "!",
                        [
                            "match",
                            ["get", "type"],
                            ["steps", "sidewalk", "crossing"],
                            true,
                            false
                        ]
                    ],
                    16,
                    ["!=", ["get", "type"], "steps"]
                ],
                ["match", ["get", "structure"], ["none", "ford"], true, false],
                ["==", ["geometry-type"], "LineString"]
            ],
            "layout": {
                "line-join": ["step", ["zoom"], "miter", 14, "round"],
                "visibility": "none"
            },
            "paint": {
                "line-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    15,
                    2,
                    18,
                    7
                ],
                "line-color": [
                    "match",
                    ["get", "type"],
                    "piste",
                    "hsl(215, 80%, 48%)",
                    [
                        "mountain_bike",
                        "hiking",
                        "trail",
                        "cycleway",
                        "footway",
                        "path",
                        "bridleway"
                    ],
                    "hsl(35, 80%, 48%)",
                    "rgb(192, 192, 191)"
                ]
            }
        },
        {
            "id": "road-steps-bg",
            "type": "line",
            "metadata": {
                "mapbox:featureComponent": "walking-cycling",
                "mapbox:group": "Walking, cycling, etc., surface"
            },
            "source": "composite",
            "source-layer": "road",
            "minzoom": 14,
            "filter": [
                "all",
                ["==", ["get", "type"], "steps"],
                ["match", ["get", "structure"], ["none", "ford"], true, false],
                ["==", ["geometry-type"], "LineString"]
            ],
            "layout": {"line-join": "round", "visibility": "none"},
            "paint": {
                "line-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    15,
                    2,
                    17,
                    4.6,
                    18,
                    7
                ],
                "line-color": "hsl(35, 80%, 48%)",
                "line-opacity": 0.75
            }
        },
        {
            "id": "road-pedestrian-case",
            "type": "line",
            "metadata": {
                "mapbox:featureComponent": "walking-cycling",
                "mapbox:group": "Walking, cycling, etc., surface"
            },
            "source": "composite",
            "source-layer": "road",
            "minzoom": 14,
            "filter": [
                "all",
                ["==", ["get", "class"], "pedestrian"],
                ["match", ["get", "structure"], ["none", "ford"], true, false],
                ["case", ["has", "layer"], [">=", ["get", "layer"], 0], true],
                ["==", ["geometry-type"], "LineString"]
            ],
            "layout": {
                "line-join": ["step", ["zoom"], "miter", 14, "round"],
                "visibility": "none"
            },
            "paint": {
                "line-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    14,
                    2,
                    18,
                    14.5
                ],
                "line-color": "#d3d3ca"
            }
        },
        {
            "id": "road-path-trail",
            "type": "line",
            "metadata": {
                "mapbox:featureComponent": "walking-cycling",
                "mapbox:group": "Walking, cycling, etc., surface"
            },
            "source": "composite",
            "source-layer": "road",
            "minzoom": 12,
            "filter": [
                "all",
                ["==", ["get", "class"], "path"],
                [
                    "match",
                    ["get", "type"],
                    ["hiking", "mountain_bike", "trail"],
                    true,
                    false
                ],
                ["match", ["get", "structure"], ["none", "ford"], true, false],
                ["==", ["geometry-type"], "LineString"]
            ],
            "layout": {
                "line-join": ["step", ["zoom"], "miter", 14, "round"],
                "visibility": "none"
            },
            "paint": {
                "line-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    15,
                    1,
                    18,
                    4
                ],
                "line-color": "#edeef2",
                "line-dasharray": [
                    "step",
                    ["zoom"],
                    ["literal", [5, 0.5]],
                    15,
                    ["literal", [4, 0.5]],
                    16,
                    ["literal", [4, 0.45]]
                ]
            }
        },
        {
            "id": "road-path-cycleway-piste",
            "type": "line",
            "metadata": {
                "mapbox:featureComponent": "walking-cycling",
                "mapbox:group": "Walking, cycling, etc., surface"
            },
            "source": "composite",
            "source-layer": "road",
            "minzoom": 12,
            "filter": [
                "all",
                ["==", ["get", "class"], "path"],
                ["match", ["get", "type"], ["cycleway", "piste"], true, false],
                ["match", ["get", "structure"], ["none", "ford"], true, false],
                ["==", ["geometry-type"], "LineString"]
            ],
            "layout": {
                "line-join": ["step", ["zoom"], "miter", 14, "round"],
                "visibility": "none"
            },
            "paint": {
                "line-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    15,
                    1,
                    18,
                    4
                ],
                "line-color": "#edeef2",
                "line-dasharray": [10, 0]
            }
        },
        {
            "id": "road-path",
            "type": "line",
            "metadata": {
                "mapbox:featureComponent": "walking-cycling",
                "mapbox:group": "Walking, cycling, etc., surface"
            },
            "source": "composite",
            "source-layer": "road",
            "minzoom": 12,
            "filter": [
                "all",
                ["==", ["get", "class"], "path"],
                [
                    "step",
                    ["zoom"],
                    [
                        "!",
                        [
                            "match",
                            ["get", "type"],
                            ["steps", "sidewalk", "crossing"],
                            true,
                            false
                        ]
                    ],
                    16,
                    ["!=", ["get", "type"], "steps"]
                ],
                ["match", ["get", "structure"], ["none", "ford"], true, false],
                ["==", ["geometry-type"], "LineString"]
            ],
            "layout": {
                "line-join": ["step", ["zoom"], "miter", 14, "round"],
                "visibility": "none"
            },
            "paint": {
                "line-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    13,
                    0.5,
                    14,
                    1,
                    15,
                    1,
                    18,
                    4
                ],
                "line-color": "#edeef2",
                "line-dasharray": [
                    "step",
                    ["zoom"],
                    ["literal", [4, 0.3]],
                    15,
                    ["literal", [1.75, 0.3]],
                    16,
                    ["literal", [1, 0.3]],
                    17,
                    ["literal", [1, 0.25]]
                ]
            }
        },
        {
            "id": "road-steps",
            "type": "line",
            "metadata": {
                "mapbox:featureComponent": "walking-cycling",
                "mapbox:group": "Walking, cycling, etc., surface"
            },
            "source": "composite",
            "source-layer": "road",
            "minzoom": 14,
            "filter": [
                "all",
                ["==", ["get", "type"], "steps"],
                ["match", ["get", "structure"], ["none", "ford"], true, false],
                ["==", ["geometry-type"], "LineString"]
            ],
            "layout": {"line-join": "round", "visibility": "none"},
            "paint": {
                "line-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    15,
                    1,
                    16,
                    1.6,
                    18,
                    6
                ],
                "line-color": "#edeef2",
                "line-dasharray": [
                    "step",
                    ["zoom"],
                    ["literal", [1, 0]],
                    15,
                    ["literal", [1.75, 1]],
                    16,
                    ["literal", [1, 0.75]],
                    17,
                    ["literal", [0.3, 0.3]]
                ]
            }
        },
        {
            "id": "road-pedestrian",
            "type": "line",
            "metadata": {
                "mapbox:featureComponent": "walking-cycling",
                "mapbox:group": "Walking, cycling, etc., surface"
            },
            "source": "composite",
            "source-layer": "road",
            "minzoom": 12,
            "filter": [
                "all",
                ["==", ["get", "class"], "pedestrian"],
                ["match", ["get", "structure"], ["none", "ford"], true, false],
                ["case", ["has", "layer"], [">=", ["get", "layer"], 0], true],
                ["==", ["geometry-type"], "LineString"]
            ],
            "layout": {
                "line-join": ["step", ["zoom"], "miter", 14, "round"],
                "visibility": "none"
            },
            "paint": {
                "line-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    14,
                    0.5,
                    18,
                    12
                ],
                "line-color": "#edeef2",
                "line-dasharray": [
                    "step",
                    ["zoom"],
                    ["literal", [2, 0.3]],
                    15,
                    ["literal", [1, 0.3]],
                    16,
                    ["literal", [1, 0.3]],
                    17,
                    ["literal", [1, 0.25]]
                ]
            }
        },
        {
            "id": "golf-hole-line",
            "type": "line",
            "metadata": {
                "mapbox:featureComponent": "walking-cycling",
                "mapbox:group": "Walking, cycling, etc., surface"
            },
            "source": "composite",
            "source-layer": "road",
            "minzoom": 16,
            "filter": ["==", ["get", "class"], "golf"],
            "layout": {"visibility": "none"},
            "paint": {"line-color": "rgba(169, 198, 169, 0.41)"}
        },
        {
            "id": "road-polygon",
            "type": "fill",
            "metadata": {
                "mapbox:featureComponent": "road-network",
                "mapbox:group": "Road network, surface"
            },
            "source": "composite",
            "source-layer": "road",
            "minzoom": 12,
            "filter": [
                "all",
                [
                    "match",
                    ["get", "class"],
                    [
                        "primary",
                        "secondary",
                        "tertiary",
                        "primary_link",
                        "secondary_link",
                        "tertiary_link",
                        "trunk",
                        "trunk_link",
                        "street",
                        "street_limited",
                        "track",
                        "service"
                    ],
                    true,
                    false
                ],
                ["match", ["get", "structure"], ["none", "ford"], true, false],
                ["==", ["geometry-type"], "Polygon"]
            ],
            "paint": {"fill-color": "#edeef2", "fill-outline-color": "#d3d3ca"}
        },
        {
            "id": "turning-feature-outline",
            "type": "circle",
            "metadata": {
                "mapbox:featureComponent": "road-network",
                "mapbox:group": "Road network, surface"
            },
            "source": "composite",
            "source-layer": "road",
            "minzoom": 15,
            "filter": [
                "all",
                [
                    "match",
                    ["get", "class"],
                    ["turning_circle", "turning_loop"],
                    true,
                    false
                ],
                ["==", ["geometry-type"], "Point"]
            ],
            "paint": {
                "circle-radius": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    15,
                    4.5,
                    16,
                    8,
                    18,
                    20,
                    22,
                    200
                ],
                "circle-color": "#edeef2",
                "circle-stroke-width": [
                    "interpolate",
                    ["linear"],
                    ["zoom"],
                    15,
                    0.8,
                    16,
                    1.2,
                    18,
                    2
                ],
                "circle-stroke-color": "#d3d3ca",
                "circle-pitch-alignment": "map"
            }
        },
        {
            "id": "road-minor-case",
            "type": "line",
            "metadata": {
                "mapbox:featureComponent": "road-network",
                "mapbox:group": "Road network, surface"
            },
            "source": "composite",
            "source-layer": "road",
            "minzoom": 13,
            "filter": [
                "all",
                [
                    "match",
                    ["get", "class"],
                    ["track"],
                    true,
                    "service",
                    ["step", ["zoom"], false, 14, true],
                    false
                ],
                ["match", ["get", "structure"], ["none", "ford"], true, false],
                ["==", ["geometry-type"], "LineString"]
            ],
            "layout": {
                "line-cap": ["step", ["zoom"], "butt", 14, "round"],
                "line-join": ["step", ["zoom"], "miter", 14, "round"]
            },
            "paint": {
                "line-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    14,
                    0.8,
                    22,
                    2
                ],
                "line-color": [
                    "match",
                    ["get", "class"],
                    "track",
                    "hsl(35, 80%, 48%)",
                    "#d3d3ca"
                ],
                "line-gap-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    14,
                    1,
                    18,
                    10,
                    22,
                    100
                ]
            }
        },
        {
            "id": "road-street-case",
            "type": "line",
            "metadata": {
                "mapbox:featureComponent": "road-network",
                "mapbox:group": "Road network, surface"
            },
            "source": "composite",
            "source-layer": "road",
            "minzoom": 14,
            "filter": [
                "all",
                [
                    "match",
                    ["get", "class"],
                    ["street", "street_limited"],
                    true,
                    false
                ],
                ["match", ["get", "structure"], ["none", "ford"], true, false],
                ["==", ["geometry-type"], "LineString"]
            ],
            "layout": {
                "line-cap": ["step", ["zoom"], "butt", 14, "round"],
                "line-join": ["step", ["zoom"], "miter", 14, "round"]
            },
            "paint": {
                "line-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    14,
                    0.8,
                    22,
                    2
                ],
                "line-color": "#d3d3ca",
                "line-gap-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    12,
                    0.5,
                    18,
                    20,
                    22,
                    200
                ],
                "line-opacity": ["step", ["zoom"], 0, 14, 1]
            }
        },
        {
            "id": "road-minor-link-case",
            "type": "line",
            "metadata": {
                "mapbox:featureComponent": "road-network",
                "mapbox:group": "Road network, surface"
            },
            "source": "composite",
            "source-layer": "road",
            "minzoom": 13,
            "filter": [
                "all",
                [
                    "match",
                    ["get", "class"],
                    ["primary_link", "secondary_link", "tertiary_link"],
                    true,
                    false
                ],
                ["match", ["get", "structure"], ["none", "ford"], true, false],
                ["==", ["geometry-type"], "LineString"]
            ],
            "layout": {
                "line-cap": ["step", ["zoom"], "butt", 14, "round"],
                "line-join": ["step", ["zoom"], "miter", 14, "round"]
            },
            "paint": {
                "line-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    14,
                    0.8,
                    22,
                    2
                ],
                "line-color": "#d3d3ca",
                "line-gap-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    12,
                    0.4,
                    18,
                    18,
                    22,
                    180
                ],
                "line-opacity": ["step", ["zoom"], 0, 11, 1]
            }
        },
        {
            "id": "road-secondary-tertiary-case",
            "type": "line",
            "metadata": {
                "mapbox:featureComponent": "road-network",
                "mapbox:group": "Road network, surface"
            },
            "source": "composite",
            "source-layer": "road",
            "minzoom": 11,
            "filter": [
                "all",
                [
                    "match",
                    ["get", "class"],
                    ["secondary", "tertiary"],
                    true,
                    false
                ],
                ["match", ["get", "structure"], ["none", "ford"], true, false],
                ["==", ["geometry-type"], "LineString"]
            ],
            "layout": {
                "line-cap": ["step", ["zoom"], "butt", 14, "round"],
                "line-join": ["step", ["zoom"], "miter", 14, "round"]
            },
            "paint": {
                "line-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    14,
                    0.8,
                    22,
                    2
                ],
                "line-color": "#d3d3ca",
                "line-gap-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    3,
                    0,
                    18,
                    26,
                    22,
                    260
                ]
            }
        },
        {
            "id": "road-primary-case",
            "type": "line",
            "metadata": {
                "mapbox:featureComponent": "road-network",
                "mapbox:group": "Road network, surface"
            },
            "source": "composite",
            "source-layer": "road",
            "minzoom": 10,
            "filter": [
                "all",
                ["==", ["get", "class"], "primary"],
                ["match", ["get", "structure"], ["none", "ford"], true, false],
                ["==", ["geometry-type"], "LineString"]
            ],
            "layout": {
                "line-cap": ["step", ["zoom"], "butt", 14, "round"],
                "line-join": ["step", ["zoom"], "miter", 14, "round"]
            },
            "paint": {
                "line-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    14,
                    1,
                    22,
                    2
                ],
                "line-color": "#d3d3ca",
                "line-gap-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    3,
                    0.8,
                    18,
                    28,
                    22,
                    280
                ]
            }
        },
        {
            "id": "road-major-link-case",
            "type": "line",
            "metadata": {
                "mapbox:featureComponent": "road-network",
                "mapbox:group": "Road network, surface"
            },
            "source": "composite",
            "source-layer": "road",
            "minzoom": 12,
            "filter": [
                "all",
                [
                    "match",
                    ["get", "class"],
                    ["motorway_link", "trunk_link"],
                    true,
                    false
                ],
                ["match", ["get", "structure"], ["none", "ford"], true, false],
                ["==", ["geometry-type"], "LineString"]
            ],
            "layout": {
                "line-cap": ["step", ["zoom"], "butt", 14, "round"],
                "line-join": ["step", ["zoom"], "miter", 14, "round"]
            },
            "paint": {
                "line-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    14,
                    0.8,
                    22,
                    2
                ],
                "line-color": "rgb(239, 239, 235)",
                "line-gap-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    12,
                    0.8,
                    18,
                    20,
                    22,
                    200
                ],
                "line-opacity": ["step", ["zoom"], 0, 11, 1]
            }
        },
        {
            "id": "road-motorway-trunk-case",
            "type": "line",
            "metadata": {
                "mapbox:featureComponent": "road-network",
                "mapbox:group": "Road network, surface"
            },
            "source": "composite",
            "source-layer": "road",
            "minzoom": 3,
            "filter": [
                "all",
                [
                    "step",
                    ["zoom"],
                    [
                        "match",
                        ["get", "class"],
                        ["motorway", "trunk"],
                        true,
                        false
                    ],
                    5,
                    [
                        "all",
                        [
                            "match",
                            ["get", "class"],
                            ["motorway", "trunk"],
                            true,
                            false
                        ],
                        [
                            "match",
                            ["get", "structure"],
                            ["none", "ford"],
                            true,
                            false
                        ]
                    ]
                ],
                ["==", ["geometry-type"], "LineString"]
            ],
            "layout": {
                "line-cap": ["step", ["zoom"], "butt", 14, "round"],
                "line-join": ["step", ["zoom"], "miter", 14, "round"]
            },
            "paint": {
                "line-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    14,
                    1,
                    22,
                    2
                ],
                "line-color": "rgb(239, 239, 235)",
                "line-gap-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    3,
                    0.8,
                    18,
                    30,
                    22,
                    300
                ],
                "line-opacity": [
                    "interpolate",
                    ["linear"],
                    ["zoom"],
                    3,
                    0,
                    3.5,
                    1
                ]
            }
        },
        {
            "id": "turning-feature",
            "type": "circle",
            "metadata": {
                "mapbox:featureComponent": "road-network",
                "mapbox:group": "Road network, surface"
            },
            "source": "composite",
            "source-layer": "road",
            "minzoom": 15,
            "filter": [
                "all",
                [
                    "match",
                    ["get", "class"],
                    ["turning_circle", "turning_loop"],
                    true,
                    false
                ],
                ["==", ["geometry-type"], "Point"]
            ],
            "paint": {
                "circle-radius": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    15,
                    4.5,
                    16,
                    8,
                    18,
                    20,
                    22,
                    200
                ],
                "circle-color": "#edeef2",
                "circle-pitch-alignment": "map"
            }
        },
        {
            "id": "road-construction",
            "type": "line",
            "metadata": {
                "mapbox:featureComponent": "road-network",
                "mapbox:group": "Road network, surface"
            },
            "source": "composite",
            "source-layer": "road",
            "minzoom": 14,
            "filter": [
                "all",
                ["==", ["get", "class"], "construction"],
                ["match", ["get", "structure"], ["none", "ford"], true, false],
                ["==", ["geometry-type"], "LineString"]
            ],
            "paint": {
                "line-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    14,
                    2,
                    18,
                    20,
                    22,
                    200
                ],
                "line-color": "#edeef2",
                "line-dasharray": [
                    "step",
                    ["zoom"],
                    ["literal", [0.4, 0.8]],
                    15,
                    ["literal", [0.3, 0.6]],
                    16,
                    ["literal", [0.2, 0.3]],
                    17,
                    ["literal", [0.2, 0.25]],
                    18,
                    ["literal", [0.15, 0.15]]
                ]
            }
        },
        {
            "id": "road-minor",
            "type": "line",
            "metadata": {
                "mapbox:featureComponent": "road-network",
                "mapbox:group": "Road network, surface"
            },
            "source": "composite",
            "source-layer": "road",
            "minzoom": 13,
            "filter": [
                "all",
                [
                    "match",
                    ["get", "class"],
                    ["track"],
                    true,
                    "service",
                    ["step", ["zoom"], false, 14, true],
                    false
                ],
                ["match", ["get", "structure"], ["none", "ford"], true, false],
                ["==", ["geometry-type"], "LineString"]
            ],
            "layout": {
                "line-cap": ["step", ["zoom"], "butt", 14, "round"],
                "line-join": ["step", ["zoom"], "miter", 14, "round"]
            },
            "paint": {
                "line-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    14,
                    1,
                    18,
                    10,
                    22,
                    100
                ],
                "line-color": "#edeef2"
            }
        },
        {
            "id": "road-minor-link",
            "type": "line",
            "metadata": {
                "mapbox:featureComponent": "road-network",
                "mapbox:group": "Road network, surface"
            },
            "source": "composite",
            "source-layer": "road",
            "minzoom": 12,
            "filter": [
                "all",
                [
                    "match",
                    ["get", "class"],
                    ["primary_link", "secondary_link", "tertiary_link"],
                    true,
                    false
                ],
                ["match", ["get", "structure"], ["none", "ford"], true, false],
                ["==", ["geometry-type"], "LineString"]
            ],
            "layout": {
                "line-cap": ["step", ["zoom"], "butt", 13, "round"],
                "line-join": ["step", ["zoom"], "miter", 13, "round"]
            },
            "paint": {
                "line-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    12,
                    0.4,
                    18,
                    18,
                    22,
                    180
                ],
                "line-color": "#edeef2"
            }
        },
        {
            "id": "road-major-link",
            "type": "line",
            "metadata": {
                "mapbox:featureComponent": "road-network",
                "mapbox:group": "Road network, surface"
            },
            "source": "composite",
            "source-layer": "road",
            "minzoom": 12,
            "filter": [
                "all",
                [
                    "match",
                    ["get", "class"],
                    ["motorway_link", "trunk_link"],
                    true,
                    false
                ],
                ["match", ["get", "structure"], ["none", "ford"], true, false],
                ["==", ["geometry-type"], "LineString"]
            ],
            "layout": {
                "line-cap": ["step", ["zoom"], "butt", 13, "round"],
                "line-join": ["step", ["zoom"], "miter", 13, "round"]
            },
            "paint": {
                "line-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    12,
                    0.8,
                    18,
                    20,
                    22,
                    200
                ],
                "line-color": [
                    "match",
                    ["get", "class"],
                    "motorway_link",
                    "hsl(15, 100%, 75%)",
                    "hsl(35, 89%, 75%)"
                ]
            }
        },
        {
            "id": "road-street",
            "type": "line",
            "metadata": {
                "mapbox:featureComponent": "road-network",
                "mapbox:group": "Road network, surface"
            },
            "source": "composite",
            "source-layer": "road",
            "minzoom": 13,
            "filter": [
                "all",
                [
                    "match",
                    ["get", "class"],
                    ["street", "street_limited"],
                    true,
                    false
                ],
                ["match", ["get", "structure"], ["none", "ford"], true, false],
                ["==", ["geometry-type"], "LineString"]
            ],
            "layout": {
                "line-cap": ["step", ["zoom"], "butt", 14, "round"],
                "line-join": ["step", ["zoom"], "miter", 14, "round"]
            },
            "paint": {
                "line-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    12,
                    0.5,
                    18,
                    20,
                    22,
                    200
                ],
                "line-color": [
                    "match",
                    ["get", "class"],
                    "street_limited",
                    "rgb(244, 244, 244)",
                    "#edeef2"
                ],
                "line-opacity": ["step", ["zoom"], 0, 14, 1]
            }
        },
        {
            "id": "road-street-low",
            "type": "line",
            "metadata": {
                "mapbox:featureComponent": "road-network",
                "mapbox:group": "Road network, surface"
            },
            "source": "composite",
            "source-layer": "road",
            "minzoom": 11,
            "maxzoom": 14,
            "filter": [
                "all",
                [
                    "match",
                    ["get", "class"],
                    ["street", "street_limited"],
                    true,
                    false
                ],
                ["match", ["get", "structure"], ["none", "ford"], true, false],
                ["==", ["geometry-type"], "LineString"]
            ],
            "layout": {
                "line-cap": ["step", ["zoom"], "butt", 14, "round"],
                "line-join": ["step", ["zoom"], "miter", 14, "round"]
            },
            "paint": {
                "line-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    12,
                    0.5,
                    18,
                    20,
                    22,
                    200
                ],
                "line-color": "#edeef2"
            }
        },
        {
            "id": "road-secondary-tertiary",
            "type": "line",
            "metadata": {
                "mapbox:featureComponent": "road-network",
                "mapbox:group": "Road network, surface"
            },
            "source": "composite",
            "source-layer": "road",
            "minzoom": 9,
            "filter": [
                "all",
                [
                    "match",
                    ["get", "class"],
                    ["secondary", "tertiary"],
                    true,
                    false
                ],
                ["match", ["get", "structure"], ["none", "ford"], true, false],
                ["==", ["geometry-type"], "LineString"]
            ],
            "layout": {
                "line-cap": ["step", ["zoom"], "butt", 14, "round"],
                "line-join": ["step", ["zoom"], "miter", 14, "round"]
            },
            "paint": {
                "line-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    3,
                    0,
                    18,
                    26,
                    22,
                    260
                ],
                "line-color": "#edeef2"
            }
        },
        {
            "id": "road-primary",
            "type": "line",
            "metadata": {
                "mapbox:featureComponent": "road-network",
                "mapbox:group": "Road network, surface"
            },
            "source": "composite",
            "source-layer": "road",
            "minzoom": 6,
            "filter": [
                "all",
                ["==", ["get", "class"], "primary"],
                ["match", ["get", "structure"], ["none", "ford"], true, false],
                ["==", ["geometry-type"], "LineString"]
            ],
            "layout": {
                "line-cap": ["step", ["zoom"], "butt", 14, "round"],
                "line-join": ["step", ["zoom"], "miter", 14, "round"]
            },
            "paint": {
                "line-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    3,
                    0.8,
                    18,
                    28,
                    22,
                    280
                ],
                "line-color": "#edeef2"
            }
        },
        {
            "id": "road-motorway-trunk",
            "type": "line",
            "metadata": {
                "mapbox:featureComponent": "road-network",
                "mapbox:group": "Road network, surface"
            },
            "source": "composite",
            "source-layer": "road",
            "minzoom": 3,
            "filter": [
                "all",
                [
                    "step",
                    ["zoom"],
                    [
                        "match",
                        ["get", "class"],
                        ["motorway", "trunk"],
                        true,
                        false
                    ],
                    5,
                    [
                        "all",
                        [
                            "match",
                            ["get", "class"],
                            ["motorway", "trunk"],
                            true,
                            false
                        ],
                        [
                            "match",
                            ["get", "structure"],
                            ["none", "ford"],
                            true,
                            false
                        ]
                    ]
                ],
                ["==", ["geometry-type"], "LineString"]
            ],
            "layout": {
                "line-cap": ["step", ["zoom"], "butt", 13, "round"],
                "line-join": ["step", ["zoom"], "miter", 13, "round"]
            },
            "paint": {
                "line-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    3,
                    0.8,
                    18,
                    30,
                    22,
                    300
                ],
                "line-color": [
                    "step",
                    ["zoom"],
                    [
                        "match",
                        ["get", "class"],
                        "motorway",
                        "hsl(15, 88%, 69%)",
                        "trunk",
                        "hsl(35, 81%, 59%)",
                        "rgb(255, 255, 255)"
                    ],
                    9,
                    [
                        "match",
                        ["get", "class"],
                        "motorway",
                        "hsl(15, 100%, 75%)",
                        "hsl(35, 89%, 75%)"
                    ]
                ],
                "line-opacity": [
                    "interpolate",
                    ["linear"],
                    ["zoom"],
                    3,
                    0,
                    3.5,
                    1
                ]
            }
        },
        {
            "id": "level-crossing",
            "type": "symbol",
            "metadata": {
                "mapbox:featureComponent": "road-network",
                "mapbox:group": "Road network, surface"
            },
            "source": "composite",
            "source-layer": "road",
            "minzoom": 16,
            "filter": [
                "all",
                ["==", ["get", "class"], "level_crossing"],
                [
                    "step",
                    ["pitch"],
                    true,
                    50,
                    ["<", ["distance-from-center"], 1],
                    60,
                    ["<", ["distance-from-center"], 1.5],
                    70,
                    ["<", ["distance-from-center"], 2]
                ]
            ],
            "layout": {
                "icon-image": "level-crossing",
                "icon-rotation-alignment": "map",
                "icon-allow-overlap": true,
                "icon-ignore-placement": true
            },
            "paint": {}
        },
        {
            "id": "road-oneway-arrow-blue",
            "type": "symbol",
            "metadata": {
                "mapbox:featureComponent": "road-network",
                "mapbox:group": "Road network, surface"
            },
            "source": "composite",
            "source-layer": "road",
            "minzoom": 16,
            "filter": [
                "all",
                ["==", ["get", "oneway"], "true"],
                [
                    "step",
                    ["zoom"],
                    [
                        "match",
                        ["get", "class"],
                        [
                            "primary",
                            "secondary",
                            "tertiary",
                            "street",
                            "street_limited"
                        ],
                        true,
                        false
                    ],
                    16,
                    [
                        "match",
                        ["get", "class"],
                        [
                            "primary",
                            "secondary",
                            "tertiary",
                            "street",
                            "street_limited",
                            "primary_link",
                            "secondary_link",
                            "tertiary_link",
                            "service",
                            "track"
                        ],
                        true,
                        false
                    ]
                ],
                ["match", ["get", "structure"], ["none", "ford"], true, false],
                [
                    "step",
                    ["pitch"],
                    true,
                    50,
                    ["<", ["distance-from-center"], 1],
                    60,
                    ["<", ["distance-from-center"], 1.5],
                    70,
                    ["<", ["distance-from-center"], 2]
                ]
            ],
            "layout": {
                "symbol-placement": "line",
                "icon-image": [
                    "step",
                    ["zoom"],
                    "oneway-small",
                    18,
                    "oneway-large"
                ],
                "symbol-spacing": 200,
                "icon-rotation-alignment": "map",
                "icon-allow-overlap": true,
                "icon-ignore-placement": true
            },
            "paint": {}
        },
        {
            "id": "road-oneway-arrow-white",
            "type": "symbol",
            "metadata": {
                "mapbox:featureComponent": "road-network",
                "mapbox:group": "Road network, surface"
            },
            "source": "composite",
            "source-layer": "road",
            "minzoom": 16,
            "filter": [
                "all",
                ["==", ["get", "oneway"], "true"],
                [
                    "match",
                    ["get", "class"],
                    ["motorway", "trunk", "motorway_link", "trunk_link"],
                    true,
                    false
                ],
                ["match", ["get", "structure"], ["none", "ford"], true, false],
                [
                    "step",
                    ["pitch"],
                    true,
                    50,
                    ["<", ["distance-from-center"], 1],
                    60,
                    ["<", ["distance-from-center"], 1.5],
                    70,
                    ["<", ["distance-from-center"], 2]
                ]
            ],
            "layout": {
                "symbol-placement": "line",
                "icon-image": [
                    "step",
                    ["zoom"],
                    "oneway-white-small",
                    18,
                    "oneway-white-large"
                ],
                "symbol-spacing": 200,
                "icon-rotation-alignment": "map",
                "icon-allow-overlap": true,
                "icon-ignore-placement": true
            },
            "paint": {}
        },
        {
            "id": "crosswalks",
            "type": "symbol",
            "metadata": {
                "mapbox:featureComponent": "road-network",
                "mapbox:group": "Road network, surface"
            },
            "source": "composite",
            "source-layer": "structure",
            "minzoom": 17,
            "filter": [
                "all",
                ["==", ["get", "type"], "crosswalk"],
                ["==", ["geometry-type"], "Point"],
                [
                    "step",
                    ["pitch"],
                    true,
                    50,
                    ["<", ["distance-from-center"], 1],
                    60,
                    ["<", ["distance-from-center"], 1.5],
                    70,
                    ["<", ["distance-from-center"], 2]
                ]
            ],
            "layout": {
                "icon-size": [
                    "interpolate",
                    ["linear"],
                    ["zoom"],
                    16,
                    0.1,
                    18,
                    0.2,
                    19,
                    0.5,
                    22,
                    1.5
                ],
                "icon-image": [
                    "step",
                    ["zoom"],
                    "crosswalk-small",
                    18,
                    "crosswalk-large"
                ],
                "icon-rotate": ["get", "direction"],
                "icon-rotation-alignment": "map",
                "icon-allow-overlap": true,
                "icon-ignore-placement": true
            },
            "paint": {}
        },
        {
            "id": "ferry",
            "type": "line",
            "metadata": {
                "mapbox:featureComponent": "transit",
                "mapbox:group": "Transit, surface"
            },
            "source": "composite",
            "source-layer": "road",
            "minzoom": 8,
            "filter": ["==", ["get", "type"], "ferry"],
            "layout": {"visibility": "none"},
            "paint": {
                "line-color": [
                    "interpolate",
                    ["linear"],
                    ["zoom"],
                    15,
                    "rgb(168, 195, 230)",
                    17,
                    "rgb(168, 170, 230)"
                ],
                "line-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    14,
                    0.5,
                    20,
                    1
                ],
                "line-dasharray": [
                    "step",
                    ["zoom"],
                    ["literal", [1, 0]],
                    13,
                    ["literal", [12, 4]]
                ]
            }
        },
        {
            "id": "ferry-auto",
            "type": "line",
            "metadata": {
                "mapbox:featureComponent": "transit",
                "mapbox:group": "Transit, surface"
            },
            "source": "composite",
            "source-layer": "road",
            "minzoom": 8,
            "filter": ["==", ["get", "type"], "ferry_auto"],
            "layout": {"visibility": "none"},
            "paint": {
                "line-color": [
                    "interpolate",
                    ["linear"],
                    ["zoom"],
                    15,
                    "rgb(168, 195, 230)",
                    17,
                    "rgb(168, 170, 230)"
                ],
                "line-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    14,
                    0.5,
                    20,
                    1
                ]
            }
        },
        {
            "id": "road-rail",
            "type": "line",
            "metadata": {
                "mapbox:featureComponent": "transit",
                "mapbox:group": "Transit, surface"
            },
            "source": "composite",
            "source-layer": "road",
            "minzoom": 13,
            "filter": [
                "all",
                [
                    "match",
                    ["get", "class"],
                    ["major_rail", "minor_rail"],
                    true,
                    false
                ],
                ["match", ["get", "structure"], ["none", "ford"], true, false]
            ],
            "layout": {"visibility": "none"},
            "paint": {
                "line-color": [
                    "interpolate",
                    ["linear"],
                    ["zoom"],
                    13,
                    "rgb(214, 214, 214)",
                    16,
                    "rgb(171, 171, 171)"
                ],
                "line-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    14,
                    0.5,
                    20,
                    1
                ]
            }
        },
        {
            "id": "road-rail-tracks",
            "type": "line",
            "metadata": {
                "mapbox:featureComponent": "transit",
                "mapbox:group": "Transit, surface"
            },
            "source": "composite",
            "source-layer": "road",
            "minzoom": 13,
            "filter": [
                "all",
                [
                    "match",
                    ["get", "class"],
                    ["major_rail", "minor_rail"],
                    true,
                    false
                ],
                ["match", ["get", "structure"], ["none", "ford"], true, false]
            ],
            "layout": {"visibility": "none"},
            "paint": {
                "line-color": [
                    "interpolate",
                    ["linear"],
                    ["zoom"],
                    13,
                    "rgb(214, 214, 214)",
                    16,
                    "rgb(171, 171, 171)"
                ],
                "line-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    14,
                    4,
                    20,
                    8
                ],
                "line-dasharray": [0.1, 15],
                "line-opacity": [
                    "interpolate",
                    ["linear"],
                    ["zoom"],
                    13.75,
                    0,
                    14,
                    1
                ]
            }
        },
        {
            "id": "gate-fence-hedge",
            "type": "line",
            "metadata": {
                "mapbox:featureComponent": "walking-cycling",
                "mapbox:group": "Walking, cycling, etc., barriers-bridges"
            },
            "source": "composite",
            "source-layer": "structure",
            "minzoom": 16,
            "filter": [
                "match",
                ["get", "class"],
                ["gate", "fence", "hedge"],
                true,
                false
            ],
            "layout": {"visibility": "none"},
            "paint": {
                "line-color": [
                    "match",
                    ["get", "class"],
                    "hedge",
                    "rgba(169, 198, 169, 0.41)",
                    "rgb(201, 201, 201)"
                ],
                "line-width": [
                    "interpolate",
                    ["linear"],
                    ["zoom"],
                    16,
                    1,
                    20,
                    3
                ],
                "line-opacity": ["match", ["get", "class"], "gate", 0.5, 1],
                "line-dasharray": [1, 2, 5, 2, 1, 2]
            }
        },
        {
            "id": "bridge-path-bg",
            "type": "line",
            "metadata": {
                "mapbox:featureComponent": "walking-cycling",
                "mapbox:group": "Walking, cycling, etc., barriers-bridges"
            },
            "source": "composite",
            "source-layer": "road",
            "minzoom": 14,
            "filter": [
                "all",
                ["==", ["get", "structure"], "bridge"],
                ["==", ["get", "class"], "path"],
                [
                    "step",
                    ["zoom"],
                    [
                        "!",
                        [
                            "match",
                            ["get", "type"],
                            ["steps", "sidewalk", "crossing"],
                            true,
                            false
                        ]
                    ],
                    16,
                    ["!=", ["get", "type"], "steps"]
                ],
                ["==", ["geometry-type"], "LineString"]
            ],
            "layout": {
                "line-cap": ["step", ["zoom"], "butt", 14, "round"],
                "visibility": "none"
            },
            "paint": {
                "line-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    15,
                    2,
                    18,
                    7
                ],
                "line-color": [
                    "match",
                    ["get", "type"],
                    "piste",
                    "hsl(215, 80%, 48%)",
                    [
                        "mountain_bike",
                        "hiking",
                        "trail",
                        "cycleway",
                        "footway",
                        "path",
                        "bridleway"
                    ],
                    "hsl(35, 80%, 48%)",
                    "rgb(192, 192, 191)"
                ]
            }
        },
        {
            "id": "bridge-steps-bg",
            "type": "line",
            "metadata": {
                "mapbox:featureComponent": "walking-cycling",
                "mapbox:group": "Walking, cycling, etc., barriers-bridges"
            },
            "source": "composite",
            "source-layer": "road",
            "minzoom": 14,
            "filter": [
                "all",
                ["==", ["get", "type"], "steps"],
                ["==", ["get", "structure"], "bridge"],
                ["==", ["geometry-type"], "LineString"]
            ],
            "layout": {"visibility": "none"},
            "paint": {
                "line-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    15,
                    2,
                    17,
                    4.6,
                    18,
                    7
                ],
                "line-color": "hsl(35, 80%, 48%)",
                "line-opacity": 0.75
            }
        },
        {
            "id": "bridge-pedestrian-case",
            "type": "line",
            "metadata": {
                "mapbox:featureComponent": "walking-cycling",
                "mapbox:group": "Walking, cycling, etc., barriers-bridges"
            },
            "source": "composite",
            "source-layer": "road",
            "minzoom": 14,
            "filter": [
                "all",
                ["==", ["get", "structure"], "bridge"],
                ["==", ["get", "class"], "pedestrian"],
                ["==", ["geometry-type"], "LineString"]
            ],
            "layout": {"visibility": "none"},
            "paint": {
                "line-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    14,
                    2,
                    18,
                    14.5
                ],
                "line-color": "#d3d3ca"
            }
        },
        {
            "id": "bridge-path-trail",
            "type": "line",
            "metadata": {
                "mapbox:featureComponent": "walking-cycling",
                "mapbox:group": "Walking, cycling, etc., barriers-bridges"
            },
            "source": "composite",
            "source-layer": "road",
            "minzoom": 14,
            "filter": [
                "all",
                ["==", ["get", "structure"], "bridge"],
                ["==", ["get", "class"], "path"],
                [
                    "match",
                    ["get", "type"],
                    ["hiking", "mountain_bike", "trail"],
                    true,
                    false
                ],
                ["==", ["geometry-type"], "LineString"]
            ],
            "layout": {"visibility": "none"},
            "paint": {
                "line-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    15,
                    1,
                    18,
                    4
                ],
                "line-color": "#edeef2",
                "line-dasharray": [
                    "step",
                    ["zoom"],
                    ["literal", [5, 0.5]],
                    15,
                    ["literal", [4, 0.5]],
                    16,
                    ["literal", [4, 0.45]]
                ]
            }
        },
        {
            "id": "bridge-path-cycleway-piste",
            "type": "line",
            "metadata": {
                "mapbox:featureComponent": "walking-cycling",
                "mapbox:group": "Walking, cycling, etc., barriers-bridges"
            },
            "source": "composite",
            "source-layer": "road",
            "minzoom": 14,
            "filter": [
                "all",
                ["==", ["get", "structure"], "bridge"],
                ["==", ["get", "class"], "path"],
                ["match", ["get", "type"], ["cycleway", "piste"], true, false],
                ["==", ["geometry-type"], "LineString"]
            ],
            "layout": {"visibility": "none"},
            "paint": {
                "line-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    15,
                    1,
                    18,
                    4
                ],
                "line-color": "#edeef2",
                "line-dasharray": [10, 0]
            }
        },
        {
            "id": "bridge-path",
            "type": "line",
            "metadata": {
                "mapbox:featureComponent": "walking-cycling",
                "mapbox:group": "Walking, cycling, etc., barriers-bridges"
            },
            "source": "composite",
            "source-layer": "road",
            "minzoom": 14,
            "filter": [
                "all",
                ["==", ["get", "structure"], "bridge"],
                ["==", ["get", "class"], "path"],
                ["!=", ["get", "type"], "steps"],
                ["==", ["geometry-type"], "LineString"]
            ],
            "layout": {"visibility": "none"},
            "paint": {
                "line-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    15,
                    1,
                    18,
                    4
                ],
                "line-color": "#edeef2",
                "line-dasharray": [
                    "step",
                    ["zoom"],
                    ["literal", [4, 0.3]],
                    15,
                    ["literal", [1.75, 0.3]],
                    16,
                    ["literal", [1, 0.3]],
                    17,
                    ["literal", [1, 0.25]]
                ]
            }
        },
        {
            "id": "bridge-steps",
            "type": "line",
            "metadata": {
                "mapbox:featureComponent": "walking-cycling",
                "mapbox:group": "Walking, cycling, etc., barriers-bridges"
            },
            "source": "composite",
            "source-layer": "road",
            "minzoom": 14,
            "filter": [
                "all",
                ["==", ["get", "type"], "steps"],
                ["==", ["get", "structure"], "bridge"],
                ["==", ["geometry-type"], "LineString"]
            ],
            "layout": {"visibility": "none"},
            "paint": {
                "line-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    15,
                    1,
                    16,
                    1.6,
                    18,
                    6
                ],
                "line-color": "#edeef2",
                "line-dasharray": [
                    "step",
                    ["zoom"],
                    ["literal", [1, 0]],
                    15,
                    ["literal", [1.75, 1]],
                    16,
                    ["literal", [1, 0.75]],
                    17,
                    ["literal", [0.3, 0.3]]
                ]
            }
        },
        {
            "id": "bridge-pedestrian",
            "type": "line",
            "metadata": {
                "mapbox:featureComponent": "walking-cycling",
                "mapbox:group": "Walking, cycling, etc., barriers-bridges"
            },
            "source": "composite",
            "source-layer": "road",
            "minzoom": 13,
            "filter": [
                "all",
                ["==", ["get", "structure"], "bridge"],
                ["==", ["get", "class"], "pedestrian"],
                ["==", ["geometry-type"], "LineString"]
            ],
            "layout": {"visibility": "none"},
            "paint": {
                "line-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    14,
                    0.5,
                    18,
                    12
                ],
                "line-color": "#edeef2",
                "line-dasharray": [
                    "step",
                    ["zoom"],
                    ["literal", [2, 0.3]],
                    15,
                    ["literal", [1, 0.3]],
                    16,
                    ["literal", [1, 0.3]],
                    17,
                    ["literal", [1, 0.25]]
                ]
            }
        },
        {
            "id": "gate-label",
            "type": "symbol",
            "metadata": {
                "mapbox:featureComponent": "walking-cycling",
                "mapbox:group": "Walking, cycling, etc., barriers-bridges"
            },
            "source": "composite",
            "source-layer": "structure",
            "minzoom": 16,
            "filter": [
                "all",
                ["==", ["get", "class"], "gate"],
                [
                    "step",
                    ["pitch"],
                    true,
                    50,
                    ["<", ["distance-from-center"], 1],
                    60,
                    ["<", ["distance-from-center"], 1.5],
                    70,
                    ["<", ["distance-from-center"], 2]
                ]
            ],
            "layout": {
                "icon-image": [
                    "match",
                    ["get", "type"],
                    "gate",
                    "gate",
                    "lift_gate",
                    "lift-gate",
                    ""
                ],
                "visibility": "none"
            },
            "paint": {}
        },
        {
            "id": "bridge-minor-case",
            "type": "line",
            "metadata": {
                "mapbox:featureComponent": "road-network",
                "mapbox:group": "Road network, bridges"
            },
            "source": "composite",
            "source-layer": "road",
            "minzoom": 13,
            "filter": [
                "all",
                ["==", ["get", "structure"], "bridge"],
                [
                    "match",
                    ["get", "class"],
                    ["track"],
                    true,
                    "service",
                    ["step", ["zoom"], false, 14, true],
                    false
                ],
                ["==", ["geometry-type"], "LineString"]
            ],
            "paint": {
                "line-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    14,
                    0.8,
                    22,
                    2
                ],
                "line-color": [
                    "match",
                    ["get", "class"],
                    "track",
                    "hsl(35, 80%, 48%)",
                    "#d3d3ca"
                ],
                "line-gap-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    14,
                    1,
                    18,
                    10,
                    22,
                    100
                ]
            }
        },
        {
            "id": "bridge-street-case",
            "type": "line",
            "metadata": {
                "mapbox:featureComponent": "road-network",
                "mapbox:group": "Road network, bridges"
            },
            "source": "composite",
            "source-layer": "road",
            "minzoom": 14,
            "filter": [
                "all",
                ["==", ["get", "structure"], "bridge"],
                [
                    "match",
                    ["get", "class"],
                    ["street", "street_limited"],
                    true,
                    false
                ],
                ["==", ["geometry-type"], "LineString"]
            ],
            "paint": {
                "line-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    14,
                    0.8,
                    22,
                    2
                ],
                "line-color": [
                    "match",
                    ["get", "class"],
                    "track",
                    "hsl(35, 80%, 48%)",
                    "#d3d3ca"
                ],
                "line-gap-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    12,
                    0.5,
                    18,
                    20,
                    22,
                    200
                ],
                "line-opacity": ["step", ["zoom"], 0, 14, 1]
            }
        },
        {
            "id": "bridge-minor-link-case",
            "type": "line",
            "metadata": {
                "mapbox:featureComponent": "road-network",
                "mapbox:group": "Road network, bridges"
            },
            "source": "composite",
            "source-layer": "road",
            "minzoom": 13,
            "filter": [
                "all",
                [
                    "match",
                    ["get", "class"],
                    ["primary_link", "secondary_link", "tertiary_link"],
                    true,
                    false
                ],
                ["==", ["get", "structure"], "bridge"],
                ["==", ["geometry-type"], "LineString"]
            ],
            "layout": {"line-join": ["step", ["zoom"], "miter", 14, "round"]},
            "paint": {
                "line-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    14,
                    0.8,
                    22,
                    2
                ],
                "line-color": "#d3d3ca",
                "line-gap-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    12,
                    0.4,
                    18,
                    18,
                    22,
                    180
                ],
                "line-opacity": ["step", ["zoom"], 0, 11, 1]
            }
        },
        {
            "id": "bridge-secondary-tertiary-case",
            "type": "line",
            "metadata": {
                "mapbox:featureComponent": "road-network",
                "mapbox:group": "Road network, bridges"
            },
            "source": "composite",
            "source-layer": "road",
            "minzoom": 11,
            "filter": [
                "all",
                ["==", ["get", "structure"], "bridge"],
                [
                    "match",
                    ["get", "class"],
                    ["secondary", "tertiary"],
                    true,
                    false
                ],
                ["==", ["geometry-type"], "LineString"]
            ],
            "paint": {
                "line-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    14,
                    1,
                    22,
                    2
                ],
                "line-color": "#d3d3ca",
                "line-gap-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    3,
                    0,
                    18,
                    26,
                    22,
                    260
                ],
                "line-opacity": ["step", ["zoom"], 0, 10, 1]
            }
        },
        {
            "id": "bridge-primary-case",
            "type": "line",
            "metadata": {
                "mapbox:featureComponent": "road-network",
                "mapbox:group": "Road network, bridges"
            },
            "source": "composite",
            "source-layer": "road",
            "minzoom": 10,
            "filter": [
                "all",
                ["==", ["get", "structure"], "bridge"],
                ["==", ["get", "class"], "primary"],
                ["==", ["geometry-type"], "LineString"]
            ],
            "paint": {
                "line-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    14,
                    1,
                    22,
                    2
                ],
                "line-color": "#d3d3ca",
                "line-gap-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    3,
                    0.8,
                    18,
                    28,
                    22,
                    280
                ],
                "line-opacity": ["step", ["zoom"], 0, 10, 1]
            }
        },
        {
            "id": "bridge-major-link-case",
            "type": "line",
            "metadata": {
                "mapbox:featureComponent": "road-network",
                "mapbox:group": "Road network, bridges"
            },
            "source": "composite",
            "source-layer": "road",
            "minzoom": 12,
            "filter": [
                "all",
                ["==", ["get", "structure"], "bridge"],
                [
                    "match",
                    ["get", "class"],
                    ["motorway_link", "trunk_link"],
                    true,
                    false
                ],
                ["<=", ["get", "layer"], 1],
                ["==", ["geometry-type"], "LineString"]
            ],
            "paint": {
                "line-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    14,
                    0.8,
                    22,
                    2
                ],
                "line-color": "rgb(239, 239, 235)",
                "line-gap-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    12,
                    0.8,
                    18,
                    20,
                    22,
                    200
                ]
            }
        },
        {
            "id": "bridge-motorway-trunk-case",
            "type": "line",
            "metadata": {
                "mapbox:featureComponent": "road-network",
                "mapbox:group": "Road network, bridges"
            },
            "source": "composite",
            "source-layer": "road",
            "minzoom": 13,
            "filter": [
                "all",
                ["==", ["get", "structure"], "bridge"],
                ["match", ["get", "class"], ["motorway", "trunk"], true, false],
                ["<=", ["get", "layer"], 1],
                ["==", ["geometry-type"], "LineString"]
            ],
            "paint": {
                "line-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    14,
                    1,
                    22,
                    2
                ],
                "line-color": "rgb(239, 239, 235)",
                "line-gap-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    3,
                    0.8,
                    18,
                    30,
                    22,
                    300
                ]
            }
        },
        {
            "id": "bridge-construction",
            "type": "line",
            "metadata": {
                "mapbox:featureComponent": "road-network",
                "mapbox:group": "Road network, bridges"
            },
            "source": "composite",
            "source-layer": "road",
            "minzoom": 14,
            "filter": [
                "all",
                ["==", ["get", "structure"], "bridge"],
                ["==", ["get", "class"], "construction"],
                ["==", ["geometry-type"], "LineString"]
            ],
            "paint": {
                "line-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    14,
                    2,
                    18,
                    20,
                    22,
                    200
                ],
                "line-color": "#d3d3ca",
                "line-dasharray": [
                    "step",
                    ["zoom"],
                    ["literal", [0.4, 0.8]],
                    15,
                    ["literal", [0.3, 0.6]],
                    16,
                    ["literal", [0.2, 0.3]],
                    17,
                    ["literal", [0.2, 0.25]],
                    18,
                    ["literal", [0.15, 0.15]]
                ]
            }
        },
        {
            "id": "bridge-minor",
            "type": "line",
            "metadata": {
                "mapbox:featureComponent": "road-network",
                "mapbox:group": "Road network, bridges"
            },
            "source": "composite",
            "source-layer": "road",
            "minzoom": 13,
            "filter": [
                "all",
                ["==", ["get", "structure"], "bridge"],
                [
                    "match",
                    ["get", "class"],
                    ["track"],
                    true,
                    "service",
                    ["step", ["zoom"], false, 14, true],
                    false
                ],
                ["==", ["geometry-type"], "LineString"]
            ],
            "layout": {"line-cap": ["step", ["zoom"], "butt", 14, "round"]},
            "paint": {
                "line-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    14,
                    1,
                    18,
                    10,
                    22,
                    100
                ],
                "line-color": "#edeef2"
            }
        },
        {
            "id": "bridge-minor-link",
            "type": "line",
            "metadata": {
                "mapbox:featureComponent": "road-network",
                "mapbox:group": "Road network, bridges"
            },
            "source": "composite",
            "source-layer": "road",
            "minzoom": 13,
            "filter": [
                "all",
                [
                    "match",
                    ["get", "class"],
                    ["primary_link", "secondary_link", "tertiary_link"],
                    true,
                    false
                ],
                ["==", ["get", "structure"], "bridge"],
                ["==", ["geometry-type"], "LineString"]
            ],
            "layout": {"line-cap": ["step", ["zoom"], "butt", 14, "round"]},
            "paint": {
                "line-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    12,
                    0.4,
                    18,
                    18,
                    22,
                    180
                ],
                "line-color": "#edeef2"
            }
        },
        {
            "id": "bridge-major-link",
            "type": "line",
            "metadata": {
                "mapbox:featureComponent": "road-network",
                "mapbox:group": "Road network, bridges"
            },
            "source": "composite",
            "source-layer": "road",
            "minzoom": 12,
            "filter": [
                "all",
                ["==", ["get", "structure"], "bridge"],
                [
                    "match",
                    ["get", "class"],
                    ["motorway_link", "trunk_link"],
                    true,
                    false
                ],
                ["<=", ["get", "layer"], 1],
                ["==", ["geometry-type"], "LineString"]
            ],
            "layout": {"line-cap": ["step", ["zoom"], "butt", 13, "round"]},
            "paint": {
                "line-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    12,
                    0.8,
                    18,
                    20,
                    22,
                    200
                ],
                "line-color": [
                    "match",
                    ["get", "class"],
                    "motorway_link",
                    "hsl(15, 100%, 75%)",
                    "hsl(35, 89%, 75%)"
                ]
            }
        },
        {
            "id": "bridge-street",
            "type": "line",
            "metadata": {
                "mapbox:featureComponent": "road-network",
                "mapbox:group": "Road network, bridges"
            },
            "source": "composite",
            "source-layer": "road",
            "minzoom": 13,
            "filter": [
                "all",
                ["==", ["get", "structure"], "bridge"],
                [
                    "match",
                    ["get", "class"],
                    ["street", "street_limited"],
                    true,
                    false
                ],
                ["==", ["geometry-type"], "LineString"]
            ],
            "layout": {"line-cap": ["step", ["zoom"], "butt", 14, "round"]},
            "paint": {
                "line-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    12,
                    0.5,
                    18,
                    20,
                    22,
                    200
                ],
                "line-color": [
                    "match",
                    ["get", "class"],
                    "street_limited",
                    "rgb(244, 244, 244)",
                    "#edeef2"
                ],
                "line-opacity": ["step", ["zoom"], 0, 14, 1]
            }
        },
        {
            "id": "bridge-street-low",
            "type": "line",
            "metadata": {
                "mapbox:featureComponent": "road-network",
                "mapbox:group": "Road network, bridges"
            },
            "source": "composite",
            "source-layer": "road",
            "minzoom": 13,
            "maxzoom": 14,
            "filter": [
                "all",
                ["==", ["get", "structure"], "bridge"],
                [
                    "match",
                    ["get", "class"],
                    ["street", "street_limited"],
                    true,
                    false
                ],
                ["==", ["geometry-type"], "LineString"]
            ],
            "layout": {
                "line-cap": ["step", ["zoom"], "butt", 14, "round"],
                "line-join": ["step", ["zoom"], "miter", 14, "round"]
            },
            "paint": {
                "line-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    12,
                    0.5,
                    18,
                    20,
                    22,
                    200
                ],
                "line-color": "#edeef2"
            }
        },
        {
            "id": "bridge-secondary-tertiary",
            "type": "line",
            "metadata": {
                "mapbox:featureComponent": "road-network",
                "mapbox:group": "Road network, bridges"
            },
            "source": "composite",
            "source-layer": "road",
            "minzoom": 13,
            "filter": [
                "all",
                ["==", ["get", "structure"], "bridge"],
                [
                    "match",
                    ["get", "class"],
                    ["secondary", "tertiary"],
                    true,
                    false
                ],
                ["==", ["geometry-type"], "LineString"]
            ],
            "layout": {"line-cap": ["step", ["zoom"], "butt", 14, "round"]},
            "paint": {
                "line-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    3,
                    0,
                    18,
                    26,
                    22,
                    260
                ],
                "line-color": "#edeef2"
            }
        },
        {
            "id": "bridge-primary",
            "type": "line",
            "metadata": {
                "mapbox:featureComponent": "road-network",
                "mapbox:group": "Road network, bridges"
            },
            "source": "composite",
            "source-layer": "road",
            "minzoom": 13,
            "filter": [
                "all",
                ["==", ["get", "structure"], "bridge"],
                ["==", ["get", "class"], "primary"],
                ["==", ["geometry-type"], "LineString"]
            ],
            "layout": {"line-cap": ["step", ["zoom"], "butt", 14, "round"]},
            "paint": {
                "line-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    3,
                    0.8,
                    18,
                    28,
                    22,
                    280
                ],
                "line-color": "#edeef2"
            }
        },
        {
            "id": "bridge-motorway-trunk",
            "type": "line",
            "metadata": {
                "mapbox:featureComponent": "road-network",
                "mapbox:group": "Road network, bridges"
            },
            "source": "composite",
            "source-layer": "road",
            "minzoom": 13,
            "filter": [
                "all",
                ["==", ["get", "structure"], "bridge"],
                ["match", ["get", "class"], ["motorway", "trunk"], true, false],
                ["<=", ["get", "layer"], 1],
                ["==", ["geometry-type"], "LineString"]
            ],
            "layout": {"line-cap": ["step", ["zoom"], "butt", 14, "round"]},
            "paint": {
                "line-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    3,
                    0.8,
                    18,
                    30,
                    22,
                    300
                ],
                "line-color": [
                    "match",
                    ["get", "class"],
                    "motorway",
                    "hsl(15, 100%, 75%)",
                    "hsl(35, 89%, 75%)"
                ]
            }
        },
        {
            "id": "bridge-major-link-2-case",
            "type": "line",
            "metadata": {
                "mapbox:featureComponent": "road-network",
                "mapbox:group": "Road network, bridges"
            },
            "source": "composite",
            "source-layer": "road",
            "minzoom": 12,
            "filter": [
                "all",
                ["==", ["get", "structure"], "bridge"],
                [">=", ["get", "layer"], 2],
                [
                    "match",
                    ["get", "class"],
                    ["motorway_link", "trunk_link"],
                    true,
                    false
                ],
                ["==", ["geometry-type"], "LineString"]
            ],
            "paint": {
                "line-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    14,
                    0.8,
                    22,
                    2
                ],
                "line-color": "rgb(239, 239, 235)",
                "line-gap-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    12,
                    0.8,
                    18,
                    20,
                    22,
                    200
                ]
            }
        },
        {
            "id": "bridge-motorway-trunk-2-case",
            "type": "line",
            "metadata": {
                "mapbox:featureComponent": "road-network",
                "mapbox:group": "Road network, bridges"
            },
            "source": "composite",
            "source-layer": "road",
            "minzoom": 13,
            "filter": [
                "all",
                ["==", ["get", "structure"], "bridge"],
                [">=", ["get", "layer"], 2],
                ["match", ["get", "class"], ["motorway", "trunk"], true, false],
                ["==", ["geometry-type"], "LineString"]
            ],
            "paint": {
                "line-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    14,
                    1,
                    22,
                    2
                ],
                "line-color": "rgb(239, 239, 235)",
                "line-gap-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    3,
                    0.8,
                    18,
                    30,
                    22,
                    300
                ]
            }
        },
        {
            "id": "bridge-major-link-2",
            "type": "line",
            "metadata": {
                "mapbox:featureComponent": "road-network",
                "mapbox:group": "Road network, bridges"
            },
            "source": "composite",
            "source-layer": "road",
            "minzoom": 12,
            "filter": [
                "all",
                ["==", ["get", "structure"], "bridge"],
                [">=", ["get", "layer"], 2],
                [
                    "match",
                    ["get", "class"],
                    ["motorway_link", "trunk_link"],
                    true,
                    false
                ],
                ["==", ["geometry-type"], "LineString"]
            ],
            "layout": {"line-cap": ["step", ["zoom"], "butt", 13, "round"]},
            "paint": {
                "line-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    12,
                    0.8,
                    18,
                    20,
                    22,
                    200
                ],
                "line-color": [
                    "match",
                    ["get", "class"],
                    "motorway_link",
                    "hsl(15, 100%, 75%)",
                    "hsl(35, 89%, 75%)"
                ]
            }
        },
        {
            "id": "bridge-motorway-trunk-2",
            "type": "line",
            "metadata": {
                "mapbox:featureComponent": "road-network",
                "mapbox:group": "Road network, bridges"
            },
            "source": "composite",
            "source-layer": "road",
            "minzoom": 13,
            "filter": [
                "all",
                ["==", ["get", "structure"], "bridge"],
                [">=", ["get", "layer"], 2],
                ["match", ["get", "class"], ["motorway", "trunk"], true, false],
                ["==", ["geometry-type"], "LineString"]
            ],
            "layout": {"line-cap": ["step", ["zoom"], "butt", 14, "round"]},
            "paint": {
                "line-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    3,
                    0.8,
                    18,
                    30,
                    22,
                    300
                ],
                "line-color": [
                    "match",
                    ["get", "class"],
                    "motorway",
                    "hsl(15, 100%, 75%)",
                    "hsl(35, 89%, 75%)"
                ]
            }
        },
        {
            "id": "bridge-oneway-arrow-blue",
            "type": "symbol",
            "metadata": {
                "mapbox:featureComponent": "road-network",
                "mapbox:group": "Road network, bridges"
            },
            "source": "composite",
            "source-layer": "road",
            "minzoom": 16,
            "filter": [
                "all",
                ["==", ["get", "structure"], "bridge"],
                ["==", ["get", "oneway"], "true"],
                [
                    "step",
                    ["zoom"],
                    [
                        "match",
                        ["get", "class"],
                        [
                            "primary",
                            "secondary",
                            "tertiary",
                            "street",
                            "street_limited"
                        ],
                        true,
                        false
                    ],
                    16,
                    [
                        "match",
                        ["get", "class"],
                        [
                            "primary",
                            "secondary",
                            "tertiary",
                            "street",
                            "street_limited",
                            "primary_link",
                            "secondary_link",
                            "tertiary_link",
                            "service",
                            "track"
                        ],
                        true,
                        false
                    ]
                ],
                [
                    "step",
                    ["pitch"],
                    true,
                    50,
                    ["<", ["distance-from-center"], 1],
                    60,
                    ["<", ["distance-from-center"], 1.5],
                    70,
                    ["<", ["distance-from-center"], 2]
                ]
            ],
            "layout": {
                "symbol-placement": "line",
                "icon-image": [
                    "step",
                    ["zoom"],
                    "oneway-small",
                    18,
                    "oneway-large"
                ],
                "symbol-spacing": 200,
                "icon-rotation-alignment": "map",
                "icon-allow-overlap": true,
                "icon-ignore-placement": true
            },
            "paint": {}
        },
        {
            "id": "bridge-oneway-arrow-white",
            "type": "symbol",
            "metadata": {
                "mapbox:featureComponent": "road-network",
                "mapbox:group": "Road network, bridges"
            },
            "source": "composite",
            "source-layer": "road",
            "minzoom": 16,
            "filter": [
                "all",
                ["==", ["get", "structure"], "bridge"],
                [
                    "match",
                    ["get", "class"],
                    ["motorway", "trunk", "motorway_link", "trunk_link"],
                    true,
                    false
                ],
                ["==", ["get", "oneway"], "true"],
                [
                    "step",
                    ["pitch"],
                    true,
                    50,
                    ["<", ["distance-from-center"], 1],
                    60,
                    ["<", ["distance-from-center"], 1.5],
                    70,
                    ["<", ["distance-from-center"], 2]
                ]
            ],
            "layout": {
                "symbol-placement": "line",
                "icon-image": "oneway-white-small",
                "symbol-spacing": 200,
                "icon-rotation-alignment": "map",
                "icon-allow-overlap": true,
                "icon-ignore-placement": true
            },
            "paint": {}
        },
        {
            "id": "bridge-rail",
            "type": "line",
            "metadata": {
                "mapbox:featureComponent": "transit",
                "mapbox:group": "Transit, bridges"
            },
            "source": "composite",
            "source-layer": "road",
            "minzoom": 13,
            "filter": [
                "all",
                ["==", ["get", "structure"], "bridge"],
                [
                    "match",
                    ["get", "class"],
                    ["major_rail", "minor_rail"],
                    true,
                    false
                ]
            ],
            "layout": {"visibility": "none"},
            "paint": {
                "line-color": [
                    "interpolate",
                    ["linear"],
                    ["zoom"],
                    13,
                    "rgb(214, 214, 214)",
                    16,
                    "rgb(171, 171, 171)"
                ],
                "line-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    14,
                    0.5,
                    20,
                    1
                ]
            }
        },
        {
            "id": "bridge-rail-tracks",
            "type": "line",
            "metadata": {
                "mapbox:featureComponent": "transit",
                "mapbox:group": "Transit, bridges"
            },
            "source": "composite",
            "source-layer": "road",
            "minzoom": 13,
            "filter": [
                "all",
                ["==", ["get", "structure"], "bridge"],
                [
                    "match",
                    ["get", "class"],
                    ["major_rail", "minor_rail"],
                    true,
                    false
                ]
            ],
            "layout": {"visibility": "none"},
            "paint": {
                "line-color": [
                    "interpolate",
                    ["linear"],
                    ["zoom"],
                    13,
                    "rgb(214, 214, 214)",
                    16,
                    "rgb(171, 171, 171)"
                ],
                "line-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    14,
                    4,
                    20,
                    8
                ],
                "line-dasharray": [0.1, 15],
                "line-opacity": [
                    "interpolate",
                    ["linear"],
                    ["zoom"],
                    13.75,
                    0,
                    14,
                    1
                ]
            }
        },
        {
            "id": "aerialway",
            "type": "line",
            "metadata": {
                "mapbox:featureComponent": "transit",
                "mapbox:group": "Transit, bridges"
            },
            "source": "composite",
            "source-layer": "road",
            "minzoom": 12,
            "filter": ["==", ["get", "class"], "aerialway"],
            "layout": {"visibility": "none"},
            "paint": {
                "line-color": "hsl(230, 50%, 60%)",
                "line-width": [
                    "interpolate",
                    ["exponential", 1.5],
                    ["zoom"],
                    14,
                    1,
                    20,
                    2
                ],
                "line-dasharray": [4, 1]
            }
        },
        {
            "id": "admin-1-boundary-bg",
            "type": "line",
            "metadata": {
                "mapbox:featureComponent": "admin-boundaries",
                "mapbox:group": "Administrative boundaries, admin"
            },
            "source": "composite",
            "source-layer": "admin",
            "minzoom": 7,
            "filter": [
                "all",
                ["==", ["get", "admin_level"], 1],
                ["==", ["get", "maritime"], "false"],
                ["match", ["get", "worldview"], ["all", "US"], true, false]
            ],
            "paint": {
                "line-color": "hsl(350, 90%, 100%)",
                "line-width": [
                    "interpolate",
                    ["linear"],
                    ["zoom"],
                    3,
                    3,
                    12,
                    6
                ],
                "line-opacity": [
                    "interpolate",
                    ["linear"],
                    ["zoom"],
                    7,
                    0,
                    8,
                    0.5
                ],
                "line-dasharray": [1, 0],
                "line-blur": ["interpolate", ["linear"], ["zoom"], 3, 0, 12, 3]
            }
        },
        {
            "id": "admin-0-boundary-bg",
            "type": "line",
            "metadata": {
                "mapbox:featureComponent": "admin-boundaries",
                "mapbox:group": "Administrative boundaries, admin"
            },
            "source": "composite",
            "source-layer": "admin",
            "minzoom": 1,
            "filter": [
                "all",
                ["==", ["get", "admin_level"], 0],
                ["==", ["get", "maritime"], "false"],
                ["match", ["get", "worldview"], ["all", "US"], true, false]
            ],
            "paint": {
                "line-width": [
                    "interpolate",
                    ["linear"],
                    ["zoom"],
                    3,
                    4,
                    12,
                    8
                ],
                "line-color": "hsl(350, 90%, 100%)",
                "line-opacity": [
                    "interpolate",
                    ["linear"],
                    ["zoom"],
                    3,
                    0,
                    4,
                    0.5
                ],
                "line-blur": ["interpolate", ["linear"], ["zoom"], 3, 0, 12, 2]
            }
        },
        {
            "id": "admin-1-boundary",
            "type": "line",
            "metadata": {
                "mapbox:featureComponent": "admin-boundaries",
                "mapbox:group": "Administrative boundaries, admin"
            },
            "source": "composite",
            "source-layer": "admin",
            "minzoom": 2,
            "filter": [
                "all",
                ["==", ["get", "admin_level"], 1],
                ["==", ["get", "maritime"], "false"],
                ["match", ["get", "worldview"], ["all", "US"], true, false]
            ],
            "layout": {},
            "paint": {
                "line-dasharray": [
                    "step",
                    ["zoom"],
                    ["literal", [2, 0]],
                    7,
                    ["literal", [2, 2, 6, 2]]
                ],
                "line-width": [
                    "interpolate",
                    ["linear"],
                    ["zoom"],
                    3,
                    0.3,
                    12,
                    1.5
                ],
                "line-opacity": [
                    "interpolate",
                    ["linear"],
                    ["zoom"],
                    2,
                    0,
                    3,
                    1
                ],
                "line-color": "hsl(350, 30%, 55%)"
            }
        },
        {
            "id": "admin-0-boundary",
            "type": "line",
            "metadata": {
                "mapbox:featureComponent": "admin-boundaries",
                "mapbox:group": "Administrative boundaries, admin"
            },
            "source": "composite",
            "source-layer": "admin",
            "minzoom": 1,
            "filter": [
                "all",
                ["==", ["get", "admin_level"], 0],
                ["==", ["get", "disputed"], "false"],
                ["==", ["get", "maritime"], "false"],
                ["match", ["get", "worldview"], ["all", "US"], true, false]
            ],
            "layout": {},
            "paint": {
                "line-color": "hsl(350, 30%, 50%)",
                "line-width": [
                    "interpolate",
                    ["linear"],
                    ["zoom"],
                    3,
                    0.5,
                    12,
                    2
                ],
                "line-dasharray": [
                    "step",
                    ["zoom"],
                    ["literal", [2, 0]],
                    7,
                    ["literal", [2, 2, 6, 2]]
                ]
            }
        },
        {
            "id": "admin-0-boundary-disputed",
            "type": "line",
            "metadata": {
                "mapbox:featureComponent": "admin-boundaries",
                "mapbox:group": "Administrative boundaries, admin"
            },
            "source": "composite",
            "source-layer": "admin",
            "minzoom": 1,
            "filter": [
                "all",
                ["==", ["get", "disputed"], "true"],
                ["==", ["get", "admin_level"], 0],
                ["==", ["get", "maritime"], "false"],
                ["match", ["get", "worldview"], ["all", "US"], true, false]
            ],
            "paint": {
                "line-color": "hsl(350, 30%, 50%)",
                "line-width": [
                    "interpolate",
                    ["linear"],
                    ["zoom"],
                    3,
                    0.5,
                    12,
                    2
                ],
                "line-dasharray": [
                    "step",
                    ["zoom"],
                    ["literal", [3, 2, 5]],
                    7,
                    ["literal", [2, 1.5]]
                ]
            }
        },
        {
            "id": "contour-label",
            "type": "symbol",
            "metadata": {
                "mapbox:featureComponent": "land-and-water",
                "mapbox:group": "Land & water, terrain-labels"
            },
            "source": "composite",
            "source-layer": "contour",
            "minzoom": 11,
            "filter": [
                "all",
                [
                    "any",
                    ["==", ["get", "index"], 10],
                    ["==", ["get", "index"], 5]
                ],
                [
                    "step",
                    ["pitch"],
                    true,
                    50,
                    ["<", ["distance-from-center"], 1],
                    60,
                    ["<", ["distance-from-center"], 1.5],
                    70,
                    ["<", ["distance-from-center"], 2]
                ]
            ],
            "layout": {
                "text-field": ["concat", ["get", "ele"], " m"],
                "symbol-placement": "line",
                "text-pitch-alignment": "viewport",
                "text-max-angle": 25,
                "text-padding": 5,
                "text-font": ["Manrope Medium", "Arial Unicode MS Regular"],
                "text-size": [
                    "interpolate",
                    ["linear"],
                    ["zoom"],
                    15,
                    9.5,
                    20,
                    12
                ]
            },
            "paint": {
                "text-color": "rgb(111, 111, 111)",
                "text-halo-width": 1,
                "text-halo-color": "rgb(255, 255, 255)"
            }
        },
        {
            "id": "building-entrance",
            "type": "symbol",
            "metadata": {
                "mapbox:featureComponent": "buildings",
                "mapbox:group": "Buildings, building-labels"
            },
            "source": "composite",
            "source-layer": "structure",
            "minzoom": 18,
            "filter": [
                "all",
                ["==", ["get", "class"], "entrance"],
                [
                    "step",
                    ["pitch"],
                    true,
                    50,
                    ["<", ["distance-from-center"], 1],
                    60,
                    ["<", ["distance-from-center"], 1.5],
                    70,
                    ["<", ["distance-from-center"], 2]
                ]
            ],
            "layout": {
                "icon-image": "marker",
                "text-field": ["get", "ref"],
                "text-size": 10,
                "text-offset": [0, -0.5],
                "text-font": ["Manrope Light", "Arial Unicode MS Regular"]
            },
            "paint": {
                "text-color": "rgb(138, 138, 138)",
                "text-halo-color": "rgb(239, 239, 239)",
                "text-halo-width": 1,
                "icon-opacity": 0.4
            }
        },
        {
            "id": "building-number-label",
            "type": "symbol",
            "metadata": {
                "mapbox:featureComponent": "buildings",
                "mapbox:group": "Buildings, building-labels"
            },
            "source": "composite",
            "source-layer": "housenum_label",
            "minzoom": 17,
            "filter": [
                "step",
                ["pitch"],
                true,
                50,
                ["<", ["distance-from-center"], 1],
                60,
                ["<", ["distance-from-center"], 1.5],
                70,
                ["<", ["distance-from-center"], 2]
            ],
            "layout": {
                "text-field": ["get", "house_num"],
                "text-font": ["Manrope Light", "Arial Unicode MS Regular"],
                "text-padding": 4,
                "text-max-width": 7,
                "text-size": 10
            },
            "paint": {
                "text-color": "rgb(138, 138, 138)",
                "text-halo-color": "rgb(239, 239, 239)",
                "text-halo-width": 1
            }
        },
        {
            "id": "block-number-label",
            "type": "symbol",
            "metadata": {
                "mapbox:featureComponent": "buildings",
                "mapbox:group": "Buildings, building-labels"
            },
            "source": "composite",
            "source-layer": "place_label",
            "minzoom": 16,
            "filter": [
                "all",
                ["==", ["get", "class"], "settlement_subdivision"],
                ["==", ["get", "type"], "block"],
                [
                    "step",
                    ["pitch"],
                    true,
                    50,
                    ["<", ["distance-from-center"], 1],
                    60,
                    ["<", ["distance-from-center"], 1.5],
                    70,
                    ["<", ["distance-from-center"], 2]
                ]
            ],
            "layout": {
                "text-field": ["get", "name"],
                "text-font": ["Manrope Light", "Arial Unicode MS Regular"],
                "text-max-width": 7,
                "text-size": 11
            },
            "paint": {
                "text-color": "rgb(148, 148, 148)",
                "text-halo-color": "rgb(255, 255, 255)",
                "text-halo-width": 0.5,
                "text-halo-blur": 0.5
            }
        },
        {
            "id": "road-label",
            "type": "symbol",
            "metadata": {
                "mapbox:featureComponent": "road-network",
                "mapbox:group": "Road network, road-labels"
            },
            "source": "composite",
            "source-layer": "road",
            "minzoom": 10,
            "filter": [
                "all",
                ["has", "name"],
                [
                    "step",
                    ["zoom"],
                    [
                        "match",
                        ["get", "class"],
                        [
                            "motorway",
                            "trunk",
                            "primary",
                            "secondary",
                            "tertiary"
                        ],
                        true,
                        false
                    ],
                    12,
                    [
                        "match",
                        ["get", "class"],
                        [
                            "motorway",
                            "trunk",
                            "primary",
                            "secondary",
                            "tertiary",
                            "street",
                            "street_limited",
                            "track"
                        ],
                        true,
                        false
                    ],
                    15,
                    [
                        "match",
                        ["get", "class"],
                        ["path", "pedestrian", "golf", "ferry", "aerialway"],
                        false,
                        true
                    ]
                ],
                [
                    "step",
                    ["pitch"],
                    true,
                    50,
                    ["<", ["distance-from-center"], 2],
                    60,
                    ["<", ["distance-from-center"], 2.5],
                    70,
                    ["<", ["distance-from-center"], 3]
                ]
            ],
            "layout": {
                "text-size": [
                    "interpolate",
                    ["linear"],
                    ["zoom"],
                    10,
                    [
                        "match",
                        ["get", "class"],
                        [
                            "motorway",
                            "trunk",
                            "primary",
                            "secondary",
                            "tertiary"
                        ],
                        10,
                        [
                            "motorway_link",
                            "trunk_link",
                            "primary_link",
                            "secondary_link",
                            "tertiary_link",
                            "street",
                            "street_limited",
                            "track"
                        ],
                        9,
                        6.5
                    ],
                    18,
                    [
                        "match",
                        ["get", "class"],
                        [
                            "motorway",
                            "trunk",
                            "primary",
                            "secondary",
                            "tertiary"
                        ],
                        16,
                        [
                            "motorway_link",
                            "trunk_link",
                            "primary_link",
                            "secondary_link",
                            "tertiary_link",
                            "street",
                            "street_limited",
                            "track"
                        ],
                        14,
                        13
                    ]
                ],
                "text-max-angle": 30,
                "text-font": ["Manrope Regular", "Arial Unicode MS Regular"],
                "symbol-placement": "line",
                "text-padding": 5,
                "text-rotation-alignment": "map",
                "text-pitch-alignment": "viewport",
                "text-field": ["coalesce", ["get", "name_en"], ["get", "name"]],
                "text-letter-spacing": 0.01
            },
            "paint": {
                "text-color": "hsl(0,0%, 0%)",
                "text-halo-color": [
                    "match",
                    ["get", "class"],
                    ["motorway", "trunk"],
                    "rgba(255, 255, 255, 0.75)",
                    "rgb(255, 255, 255)"
                ],
                "text-halo-width": 1,
                "text-halo-blur": 1
            }
        },
        {
            "id": "road-intersection",
            "type": "symbol",
            "metadata": {
                "mapbox:featureComponent": "road-network",
                "mapbox:group": "Road network, road-labels"
            },
            "source": "composite",
            "source-layer": "road",
            "minzoom": 15,
            "filter": [
                "all",
                ["==", ["get", "class"], "intersection"],
                ["has", "name"],
                [
                    "step",
                    ["pitch"],
                    true,
                    50,
                    ["<", ["distance-from-center"], 1],
                    60,
                    ["<", ["distance-from-center"], 1.5],
                    70,
                    ["<", ["distance-from-center"], 2]
                ]
            ],
            "layout": {
                "text-field": ["coalesce", ["get", "name_en"], ["get", "name"]],
                "icon-image": "intersection",
                "icon-text-fit": "both",
                "icon-text-fit-padding": [1, 2, 1, 2],
                "text-size": [
                    "interpolate",
                    ["exponential", 1.2],
                    ["zoom"],
                    15,
                    9,
                    18,
                    12
                ],
                "text-font": ["Manrope Bold", "Arial Unicode MS Bold"]
            },
            "paint": {"text-color": "hsl(230, 36%, 64%)"}
        },
        {
            "id": "road-number-shield",
            "type": "symbol",
            "metadata": {
                "mapbox:featureComponent": "road-network",
                "mapbox:group": "Road network, road-labels"
            },
            "source": "composite",
            "source-layer": "road",
            "minzoom": 6,
            "filter": [
                "all",
                [
                    "case",
                    ["has", "reflen"],
                    ["<=", ["get", "reflen"], 6],
                    ["has", "shield_beta"]
                ],
                [
                    "match",
                    ["get", "class"],
                    ["pedestrian", "service"],
                    false,
                    true
                ],
                [
                    "step",
                    ["zoom"],
                    ["==", ["geometry-type"], "Point"],
                    11,
                    [">", ["get", "len"], 5000],
                    12,
                    [">", ["get", "len"], 2500],
                    13,
                    [">", ["get", "len"], 1000],
                    14,
                    true
                ],
                [
                    "step",
                    ["pitch"],
                    true,
                    50,
                    ["<", ["distance-from-center"], 2],
                    60,
                    ["<", ["distance-from-center"], 2.5],
                    70,
                    ["<", ["distance-from-center"], 3]
                ]
            ],
            "layout": {
                "text-size": 9,
                "icon-image": [
                    "case",
                    ["has", "shield_beta"],
                    [
                        "coalesce",
                        [
                            "image",
                            [
                                "concat",
                                ["get", "shield_beta"],
                                "-",
                                ["to-string", ["get", "reflen"]]
                            ]
                        ],
                        [
                            "image",
                            [
                                "concat",
                                ["get", "shield"],
                                "-",
                                ["to-string", ["get", "reflen"]]
                            ]
                        ],
                        [
                            "image",
                            [
                                "concat",
                                "default-",
                                ["to-string", ["get", "reflen"]]
                            ]
                        ]
                    ],
                    [
                        "concat",
                        ["get", "shield"],
                        "-",
                        ["to-string", ["get", "reflen"]]
                    ]
                ],
                "icon-rotation-alignment": "viewport",
                "text-max-angle": 38,
                "symbol-spacing": [
                    "interpolate",
                    ["linear"],
                    ["zoom"],
                    11,
                    400,
                    14,
                    600
                ],
                "text-font": ["Manrope Bold", "Arial Unicode MS Bold"],
                "symbol-placement": ["step", ["zoom"], "point", 11, "line"],
                "text-rotation-alignment": "viewport",
                "text-field": ["get", "ref"],
                "text-letter-spacing": 0.05
            },
            "paint": {
                "text-color": [
                    "case",
                    ["has", "shield_beta"],
                    [
                        "case",
                        [
                            "all",
                            ["has", "shield_text_color_beta"],
                            [
                                "to-boolean",
                                [
                                    "coalesce",
                                    [
                                        "image",
                                        [
                                            "concat",
                                            ["get", "shield_beta"],
                                            "-",
                                            ["to-string", ["get", "reflen"]]
                                        ]
                                    ],
                                    ""
                                ]
                            ]
                        ],
                        [
                            "match",
                            ["get", "shield_text_color_beta"],
                            "white",
                            "hsl(0, 0%, 100%)",
                            "yellow",
                            "hsl(50, 63%, 70%)",
                            "orange",
                            "hsl(25, 63%, 75%)",
                            "blue",
                            "hsl(230, 36%, 44%)",
                            "red",
                            "hsl(0, 54%, 59%)",
                            "green",
                            "hsl(140, 46%, 37%)",
                            "hsl(230, 11%, 13%)"
                        ],
                        "hsl(230, 11%, 13%)"
                    ],
                    [
                        "match",
                        ["get", "shield_text_color"],
                        "white",
                        "hsl(0, 0%, 100%)",
                        "yellow",
                        "hsl(50, 63%, 70%)",
                        "orange",
                        "hsl(25, 63%, 75%)",
                        "blue",
                        "hsl(230, 36%, 44%)",
                        "red",
                        "hsl(0, 54%, 59%)",
                        "green",
                        "hsl(140, 46%, 37%)",
                        "hsl(230, 11%, 13%)"
                    ]
                ]
            }
        },
        {
            "id": "road-exit-shield",
            "type": "symbol",
            "metadata": {
                "mapbox:featureComponent": "road-network",
                "mapbox:group": "Road network, road-labels"
            },
            "source": "composite",
            "source-layer": "motorway_junction",
            "minzoom": 14,
            "filter": [
                "all",
                ["has", "reflen"],
                ["<=", ["get", "reflen"], 9],
                [
                    "step",
                    ["pitch"],
                    true,
                    50,
                    ["<", ["distance-from-center"], 1],
                    60,
                    ["<", ["distance-from-center"], 1.5],
                    70,
                    ["<", ["distance-from-center"], 2]
                ]
            ],
            "layout": {
                "text-field": ["get", "ref"],
                "text-size": 9,
                "icon-image": [
                    "concat",
                    "motorway-exit-",
                    ["to-string", ["get", "reflen"]]
                ],
                "text-font": ["Manrope Bold", "Arial Unicode MS Bold"]
            },
            "paint": {
                "text-color": "hsl(0, 0%, 100%)",
                "text-translate": [0, 0]
            }
        },
        {
            "id": "path-pedestrian-label",
            "type": "symbol",
            "metadata": {
                "mapbox:featureComponent": "walking-cycling",
                "mapbox:group": "Walking, cycling, etc., walking-cycling-labels"
            },
            "source": "composite",
            "source-layer": "road",
            "minzoom": 12,
            "filter": [
                "all",
                ["case", ["has", "layer"], [">=", ["get", "layer"], 0], true],
                [
                    "step",
                    ["zoom"],
                    ["match", ["get", "class"], ["pedestrian"], true, false],
                    15,
                    [
                        "match",
                        ["get", "class"],
                        ["path", "pedestrian"],
                        true,
                        false
                    ]
                ],
                [
                    "step",
                    ["pitch"],
                    true,
                    50,
                    ["<", ["distance-from-center"], 1],
                    60,
                    ["<", ["distance-from-center"], 1.5],
                    70,
                    ["<", ["distance-from-center"], 2]
                ]
            ],
            "layout": {
                "text-size": [
                    "interpolate",
                    ["linear"],
                    ["zoom"],
                    10,
                    ["match", ["get", "class"], "pedestrian", 9, 6.5],
                    18,
                    ["match", ["get", "class"], "pedestrian", 14, 13]
                ],
                "text-max-angle": 30,
                "text-font": ["Manrope Regular", "Arial Unicode MS Regular"],
                "symbol-placement": "line",
                "text-padding": 1,
                "visibility": "none",
                "text-rotation-alignment": "map",
                "text-pitch-alignment": "viewport",
                "text-field": ["coalesce", ["get", "name_en"], ["get", "name"]],
                "text-letter-spacing": 0.01
            },
            "paint": {
                "text-color": "hsl(0,0%, 0%)",
                "text-halo-color": "rgb(255, 255, 255)",
                "text-halo-width": 1,
                "text-halo-blur": 1
            }
        },
        {
            "id": "golf-hole-label",
            "type": "symbol",
            "metadata": {
                "mapbox:featureComponent": "walking-cycling",
                "mapbox:group": "Walking, cycling, etc., walking-cycling-labels"
            },
            "source": "composite",
            "source-layer": "road",
            "minzoom": 16,
            "filter": [
                "all",
                ["==", ["get", "class"], "golf"],
                [
                    "step",
                    ["pitch"],
                    true,
                    50,
                    ["<", ["distance-from-center"], 1],
                    60,
                    ["<", ["distance-from-center"], 1.5],
                    70,
                    ["<", ["distance-from-center"], 2]
                ]
            ],
            "layout": {
                "text-field": ["coalesce", ["get", "name_en"], ["get", "name"]],
                "text-font": ["Manrope Medium", "Arial Unicode MS Regular"],
                "text-size": 12,
                "visibility": "none"
            },
            "paint": {
                "text-halo-color": "rgba(194, 225, 194, 0.41)",
                "text-halo-width": 0.5,
                "text-halo-blur": 0.5,
                "text-color": "rgb(197, 236, 166)"
            }
        },
        {
            "id": "ferry-aerialway-label",
            "type": "symbol",
            "metadata": {
                "mapbox:featureComponent": "transit",
                "mapbox:group": "Transit, ferry-aerialway-labels"
            },
            "source": "composite",
            "source-layer": "road",
            "minzoom": 15,
            "filter": [
                "all",
                [
                    "match",
                    ["get", "class"],
                    "aerialway",
                    true,
                    "ferry",
                    true,
                    false
                ],
                [
                    "step",
                    ["pitch"],
                    true,
                    50,
                    ["<", ["distance-from-center"], 1],
                    60,
                    ["<", ["distance-from-center"], 1.5],
                    70,
                    ["<", ["distance-from-center"], 2]
                ]
            ],
            "layout": {
                "text-size": [
                    "interpolate",
                    ["linear"],
                    ["zoom"],
                    10,
                    6.5,
                    18,
                    13
                ],
                "text-max-angle": 30,
                "text-font": ["Manrope Regular", "Arial Unicode MS Regular"],
                "symbol-placement": "line",
                "text-padding": 1,
                "visibility": "none",
                "text-rotation-alignment": "map",
                "text-pitch-alignment": "viewport",
                "text-field": ["coalesce", ["get", "name_en"], ["get", "name"]],
                "text-letter-spacing": 0.01
            },
            "paint": {
                "text-color": [
                    "match",
                    ["get", "class"],
                    "ferry",
                    "rgb(138, 171, 194)",
                    "hsl(230, 50%, 60%)"
                ],
                "text-halo-color": [
                    "match",
                    ["get", "class"],
                    "ferry",
                    "#c1ddf1",
                    "rgb(255, 255, 255)"
                ],
                "text-halo-width": 1,
                "text-halo-blur": 1
            }
        },
        {
            "id": "waterway-label",
            "type": "symbol",
            "metadata": {
                "mapbox:featureComponent": "natural-features",
                "mapbox:group": "Natural features, natural-labels"
            },
            "source": "composite",
            "source-layer": "natural_label",
            "minzoom": 13,
            "filter": [
                "all",
                [
                    "match",
                    ["get", "class"],
                    [
                        "canal",
                        "river",
                        "stream",
                        "disputed_canal",
                        "disputed_river",
                        "disputed_stream"
                    ],
                    ["match", ["get", "worldview"], ["all", "US"], true, false],
                    false
                ],
                [
                    "step",
                    ["pitch"],
                    true,
                    50,
                    ["<", ["distance-from-center"], 1],
                    60,
                    ["<", ["distance-from-center"], 1.5],
                    70,
                    ["<", ["distance-from-center"], 2]
                ],
                ["==", ["geometry-type"], "LineString"]
            ],
            "layout": {
                "text-font": ["Manrope Light", "Arial Unicode MS Regular"],
                "text-max-angle": 30,
                "symbol-spacing": [
                    "interpolate",
                    ["linear", 1],
                    ["zoom"],
                    15,
                    250,
                    17,
                    400
                ],
                "text-size": [
                    "interpolate",
                    ["linear"],
                    ["zoom"],
                    13,
                    12,
                    18,
                    18
                ],
                "symbol-placement": "line",
                "text-pitch-alignment": "viewport",
                "text-field": ["coalesce", ["get", "name_en"], ["get", "name"]]
            },
            "paint": {
                "text-color": "rgb(111, 151, 180)",
                "text-halo-color": "rgba(255, 255, 255, 0.5)"
            }
        },
        {
            "id": "natural-line-label",
            "type": "symbol",
            "metadata": {
                "mapbox:featureComponent": "natural-features",
                "mapbox:group": "Natural features, natural-labels"
            },
            "source": "composite",
            "source-layer": "natural_label",
            "minzoom": 4,
            "filter": [
                "all",
                [
                    "match",
                    ["get", "class"],
                    [
                        "glacier",
                        "landform",
                        "disputed_glacier",
                        "disputed_landform"
                    ],
                    ["match", ["get", "worldview"], ["all", "US"], true, false],
                    false
                ],
                ["<=", ["get", "filterrank"], 4],
                [
                    "step",
                    ["pitch"],
                    true,
                    50,
                    ["<", ["distance-from-center"], 1],
                    60,
                    ["<", ["distance-from-center"], 1.5],
                    70,
                    ["<", ["distance-from-center"], 2]
                ],
                ["==", ["geometry-type"], "LineString"]
            ],
            "layout": {
                "text-size": [
                    "step",
                    ["zoom"],
                    ["step", ["get", "sizerank"], 18, 5, 12],
                    17,
                    ["step", ["get", "sizerank"], 18, 13, 12]
                ],
                "text-max-angle": 30,
                "text-field": ["coalesce", ["get", "name_en"], ["get", "name"]],
                "text-font": ["Manrope Medium", "Arial Unicode MS Regular"],
                "symbol-placement": "line-center",
                "text-pitch-alignment": "viewport"
            },
            "paint": {
                "text-halo-width": 0.5,
                "text-halo-color": "rgb(255, 255, 255)",
                "text-halo-blur": 0.5,
                "text-color": "hsl(340, 10%, 38%)"
            }
        },
        {
            "id": "natural-point-label",
            "type": "symbol",
            "metadata": {
                "mapbox:featureComponent": "natural-features",
                "mapbox:group": "Natural features, natural-labels"
            },
            "source": "composite",
            "source-layer": "natural_label",
            "minzoom": 4,
            "filter": [
                "all",
                [
                    "match",
                    ["get", "class"],
                    [
                        "dock",
                        "glacier",
                        "landform",
                        "water_feature",
                        "wetland",
                        "disputed_dock",
                        "disputed_glacier",
                        "disputed_landform",
                        "disputed_water_feature",
                        "disputed_wetland"
                    ],
                    ["match", ["get", "worldview"], ["all", "US"], true, false],
                    false
                ],
                ["<=", ["get", "filterrank"], 4],
                [
                    "step",
                    ["pitch"],
                    true,
                    50,
                    ["<", ["distance-from-center"], 1],
                    60,
                    ["<", ["distance-from-center"], 1.5],
                    70,
                    ["<", ["distance-from-center"], 2]
                ],
                ["==", ["geometry-type"], "Point"]
            ],
            "layout": {
                "text-size": [
                    "step",
                    ["zoom"],
                    ["step", ["get", "sizerank"], 18, 5, 12],
                    17,
                    ["step", ["get", "sizerank"], 18, 13, 12]
                ],
                "icon-image": [
                    "case",
                    ["has", "maki_beta"],
                    [
                        "coalesce",
                        ["image", ["get", "maki_beta"]],
                        ["image", ["get", "maki"]]
                    ],
                    ["image", ["get", "maki"]]
                ],
                "text-font": ["Manrope Medium", "Arial Unicode MS Regular"],
                "text-offset": [
                    "step",
                    ["zoom"],
                    [
                        "step",
                        ["get", "sizerank"],
                        ["literal", [0, 0]],
                        5,
                        ["literal", [0, 0.8]]
                    ],
                    17,
                    [
                        "step",
                        ["get", "sizerank"],
                        ["literal", [0, 0]],
                        13,
                        ["literal", [0, 0.8]]
                    ]
                ],
                "text-anchor": [
                    "step",
                    ["zoom"],
                    ["step", ["get", "sizerank"], "center", 5, "top"],
                    17,
                    ["step", ["get", "sizerank"], "center", 13, "top"]
                ],
                "text-field": ["coalesce", ["get", "name_en"], ["get", "name"]]
            },
            "paint": {
                "icon-opacity": [
                    "step",
                    ["zoom"],
                    ["step", ["get", "sizerank"], 0, 5, 1],
                    17,
                    ["step", ["get", "sizerank"], 0, 13, 1]
                ],
                "text-halo-color": "rgb(255, 255, 255)",
                "text-halo-width": 0.5,
                "text-halo-blur": 0.5,
                "text-color": "hsl(340, 10%, 38%)"
            }
        },
        {
            "id": "water-line-label",
            "type": "symbol",
            "metadata": {
                "mapbox:featureComponent": "natural-features",
                "mapbox:group": "Natural features, natural-labels"
            },
            "source": "composite",
            "source-layer": "natural_label",
            "minzoom": 1,
            "filter": [
                "all",
                [
                    "match",
                    ["get", "class"],
                    [
                        "bay",
                        "ocean",
                        "reservoir",
                        "sea",
                        "water",
                        "disputed_bay",
                        "disputed_ocean",
                        "disputed_reservoir",
                        "disputed_sea",
                        "disputed_water"
                    ],
                    ["match", ["get", "worldview"], ["all", "US"], true, false],
                    false
                ],
                [
                    "step",
                    ["pitch"],
                    true,
                    50,
                    ["<", ["distance-from-center"], 1],
                    60,
                    ["<", ["distance-from-center"], 1.5],
                    70,
                    ["<", ["distance-from-center"], 2]
                ],
                ["==", ["geometry-type"], "LineString"]
            ],
            "layout": {
                "text-size": [
                    "interpolate",
                    ["linear"],
                    ["zoom"],
                    0,
                    ["*", ["-", 16, ["sqrt", ["get", "sizerank"]]], 1],
                    22,
                    ["*", ["-", 22, ["sqrt", ["get", "sizerank"]]], 1]
                ],
                "text-max-angle": 30,
                "text-letter-spacing": [
                    "match",
                    ["get", "class"],
                    "ocean",
                    0.25,
                    ["sea", "bay"],
                    0.15,
                    0
                ],
                "text-font": ["Manrope Light", "Arial Unicode MS Regular"],
                "symbol-placement": "line-center",
                "text-pitch-alignment": "viewport",
                "text-field": ["coalesce", ["get", "name_en"], ["get", "name"]]
            },
            "paint": {
                "text-color": [
                    "match",
                    ["get", "class"],
                    ["bay", "ocean", "sea"],
                    "rgb(102, 169, 214)",
                    "rgb(111, 151, 180)"
                ],
                "text-halo-color": "rgba(255, 255, 255, 0.5)"
            }
        },
        {
            "id": "water-point-label",
            "type": "symbol",
            "metadata": {
                "mapbox:featureComponent": "natural-features",
                "mapbox:group": "Natural features, natural-labels"
            },
            "source": "composite",
            "source-layer": "natural_label",
            "minzoom": 1,
            "filter": [
                "all",
                [
                    "match",
                    ["get", "class"],
                    [
                        "bay",
                        "ocean",
                        "reservoir",
                        "sea",
                        "water",
                        "disputed_bay",
                        "disputed_ocean",
                        "disputed_reservoir",
                        "disputed_sea",
                        "disputed_water"
                    ],
                    ["match", ["get", "worldview"], ["all", "US"], true, false],
                    false
                ],
                [
                    "step",
                    ["pitch"],
                    true,
                    50,
                    ["<", ["distance-from-center"], 1],
                    60,
                    ["<", ["distance-from-center"], 1.5],
                    70,
                    ["<", ["distance-from-center"], 2]
                ],
                ["==", ["geometry-type"], "Point"]
            ],
            "layout": {
                "text-line-height": 1.3,
                "text-size": [
                    "interpolate",
                    ["linear"],
                    ["zoom"],
                    0,
                    ["*", ["-", 16, ["sqrt", ["get", "sizerank"]]], 1],
                    22,
                    ["*", ["-", 22, ["sqrt", ["get", "sizerank"]]], 1]
                ],
                "text-font": ["Manrope Light", "Arial Unicode MS Regular"],
                "text-field": ["coalesce", ["get", "name_en"], ["get", "name"]],
                "text-letter-spacing": [
                    "match",
                    ["get", "class"],
                    "ocean",
                    0.25,
                    ["bay", "sea"],
                    0.15,
                    0.01
                ],
                "text-max-width": [
                    "match",
                    ["get", "class"],
                    "ocean",
                    4,
                    "sea",
                    5,
                    ["bay", "water"],
                    7,
                    10
                ]
            },
            "paint": {
                "text-color": [
                    "match",
                    ["get", "class"],
                    ["bay", "ocean", "sea"],
                    "rgb(102, 169, 214)",
                    "rgb(111, 151, 180)"
                ],
                "text-halo-color": "rgba(255, 255, 255, 0.5)"
            }
        },
        {
            "id": "poi-label",
            "type": "symbol",
            "metadata": {
                "mapbox:featureComponent": "point-of-interest-labels",
                "mapbox:group": "Point of interest labels, poi-labels"
            },
            "source": "composite",
            "source-layer": "poi_label",
            "minzoom": 6,
            "filter": [
                "all",
                [
                    "<=",
                    ["get", "filterrank"],
                    [
                        "+",
                        ["step", ["zoom"], 0, 16, 1, 17, 2],
                        [
                            "match",
                            ["get", "class"],
                            "food_and_drink_stores",
                            3,
                            "historic",
                            3,
                            "landmark",
                            3,
                            "medical",
                            3,
                            "motorist",
                            3,
                            "park_like",
                            4,
                            "sport_and_leisure",
                            4,
                            "visitor_amenities",
                            4,
                            2
                        ]
                    ]
                ],
                [
                    "step",
                    ["pitch"],
                    true,
                    50,
                    ["<", ["distance-from-center"], 2],
                    60,
                    ["<", ["distance-from-center"], 2.5],
                    70,
                    ["<", ["distance-from-center"], 3]
                ]
            ],
            "layout": {
                "text-size": [
                    "step",
                    ["zoom"],
                    ["step", ["get", "sizerank"], 18, 5, 12],
                    17,
                    ["step", ["get", "sizerank"], 18, 13, 12]
                ],
                "icon-image": [
                    "case",
                    ["has", "maki_beta"],
                    [
                        "coalesce",
                        ["image", ["get", "maki_beta"]],
                        ["image", ["get", "maki"]]
                    ],
                    ["image", ["get", "maki"]]
                ],
                "text-font": ["Manrope Medium", "Arial Unicode MS Regular"],
                "text-offset": [
                    "step",
                    ["zoom"],
                    [
                        "step",
                        ["get", "sizerank"],
                        ["literal", [0, 0]],
                        5,
                        ["literal", [0, 0.8]]
                    ],
                    17,
                    [
                        "step",
                        ["get", "sizerank"],
                        ["literal", [0, 0]],
                        13,
                        ["literal", [0, 0.8]]
                    ]
                ],
                "text-anchor": [
                    "step",
                    ["zoom"],
                    ["step", ["get", "sizerank"], "center", 5, "top"],
                    17,
                    ["step", ["get", "sizerank"], "center", 13, "top"]
                ],
                "text-field": ["coalesce", ["get", "name_en"], ["get", "name"]],
                "visibility": "none"
            },
            "paint": {
                "icon-opacity": [
                    "step",
                    ["zoom"],
                    ["step", ["get", "sizerank"], 0, 5, 1],
                    17,
                    ["step", ["get", "sizerank"], 0, 13, 1]
                ],
                "text-halo-color": "rgb(255, 255, 255)",
                "text-halo-width": 0.5,
                "text-halo-blur": 0.5,
                "text-color": [
                    "match",
                    ["get", "class"],
                    "food_and_drink",
                    "hsl(35, 80%, 38%)",
                    "park_like",
                    "rgb(197, 236, 166)",
                    "education",
                    "hsl(30, 60%, 28%)",
                    "medical",
                    "rgb(215, 120, 101)",
                    "sport_and_leisure",
                    "hsl(210, 60%, 38%)",
                    "hsl(340, 10%, 38%)"
                ]
            }
        },
        {
            "id": "transit-label",
            "type": "symbol",
            "metadata": {
                "mapbox:featureComponent": "transit",
                "mapbox:group": "Transit, transit-labels"
            },
            "source": "composite",
            "source-layer": "transit_stop_label",
            "minzoom": 12,
            "filter": [
                "all",
                [
                    "step",
                    ["zoom"],
                    [
                        "all",
                        ["<=", ["get", "filterrank"], 4],
                        [
                            "match",
                            ["get", "mode"],
                            "rail",
                            true,
                            "metro_rail",
                            true,
                            false
                        ],
                        ["!=", ["get", "stop_type"], "entrance"]
                    ],
                    14,
                    [
                        "all",
                        [
                            "match",
                            ["get", "mode"],
                            "rail",
                            true,
                            "metro_rail",
                            true,
                            false
                        ],
                        ["!=", ["get", "stop_type"], "entrance"]
                    ],
                    15,
                    [
                        "all",
                        [
                            "match",
                            ["get", "mode"],
                            "rail",
                            true,
                            "metro_rail",
                            true,
                            "ferry",
                            true,
                            "light_rail",
                            true,
                            false
                        ],
                        ["!=", ["get", "stop_type"], "entrance"]
                    ],
                    16,
                    [
                        "all",
                        ["match", ["get", "mode"], "bus", false, true],
                        ["!=", ["get", "stop_type"], "entrance"]
                    ],
                    17,
                    ["!=", ["get", "stop_type"], "entrance"],
                    19,
                    true
                ],
                [
                    "step",
                    ["pitch"],
                    true,
                    50,
                    ["<", ["distance-from-center"], 1],
                    60,
                    ["<", ["distance-from-center"], 1.5],
                    70,
                    ["<", ["distance-from-center"], 2]
                ]
            ],
            "layout": {
                "text-size": 12,
                "icon-image": ["get", "network"],
                "text-font": ["Manrope Medium", "Arial Unicode MS Regular"],
                "text-justify": [
                    "match",
                    ["get", "stop_type"],
                    "entrance",
                    "left",
                    "center"
                ],
                "visibility": "none",
                "text-offset": [
                    "match",
                    ["get", "stop_type"],
                    "entrance",
                    ["literal", [1, 0]],
                    ["literal", [0, 0.8]]
                ],
                "text-anchor": [
                    "match",
                    ["get", "stop_type"],
                    "entrance",
                    "left",
                    "top"
                ],
                "text-field": [
                    "step",
                    ["zoom"],
                    "",
                    13,
                    [
                        "match",
                        ["get", "mode"],
                        ["rail", "metro_rail"],
                        ["coalesce", ["get", "name_en"], ["get", "name"]],
                        ""
                    ],
                    14,
                    [
                        "match",
                        ["get", "mode"],
                        ["bus", "bicycle"],
                        "",
                        ["coalesce", ["get", "name_en"], ["get", "name"]]
                    ],
                    18,
                    ["coalesce", ["get", "name_en"], ["get", "name"]]
                ],
                "text-letter-spacing": 0.01,
                "text-max-width": [
                    "match",
                    ["get", "stop_type"],
                    "entrance",
                    15,
                    9
                ]
            },
            "paint": {
                "text-halo-color": "rgb(255, 255, 255)",
                "text-color": [
                    "match",
                    ["get", "network"],
                    "tokyo-metro",
                    "hsl(180, 30%, 30%)",
                    "mexico-city-metro",
                    "hsl(25, 63%, 63%)",
                    [
                        "barcelona-metro",
                        "delhi-metro",
                        "hong-kong-mtr",
                        "milan-metro",
                        "osaka-subway"
                    ],
                    "hsl(0, 57%, 47%)",
                    ["boston-t", "washington-metro"],
                    "hsl(230, 11%, 20%)",
                    [
                        "chongqing-rail-transit",
                        "kiev-metro",
                        "singapore-mrt",
                        "taipei-metro"
                    ],
                    "hsl(140, 56%, 25%)",
                    "hsl(230, 50%, 60%)"
                ],
                "text-halo-blur": 0.5,
                "text-halo-width": 0.5
            }
        },
        {
            "id": "airport-label",
            "type": "symbol",
            "metadata": {
                "mapbox:featureComponent": "transit",
                "mapbox:group": "Transit, transit-labels"
            },
            "source": "composite",
            "source-layer": "airport_label",
            "minzoom": 8,
            "filter": [
                "all",
                [
                    "match",
                    ["get", "class"],
                    [
                        "military",
                        "civil",
                        "disputed_military",
                        "disputed_civil"
                    ],
                    ["match", ["get", "worldview"], ["all", "US"], true, false],
                    false
                ],
                [
                    "step",
                    ["pitch"],
                    true,
                    50,
                    ["<", ["distance-from-center"], 3],
                    60,
                    ["<", ["distance-from-center"], 4],
                    70,
                    ["<", ["distance-from-center"], 5]
                ]
            ],
            "layout": {
                "text-line-height": 1.1,
                "text-size": ["step", ["get", "sizerank"], 18, 9, 12],
                "icon-image": ["get", "maki"],
                "text-font": ["Manrope Medium", "Arial Unicode MS Regular"],
                "visibility": "none",
                "text-offset": [0, 0.8],
                "text-rotation-alignment": "viewport",
                "text-anchor": "top",
                "text-field": [
                    "step",
                    ["get", "sizerank"],
                    [
                        "case",
                        ["has", "ref"],
                        [
                            "concat",
                            ["get", "ref"],                            
                            ["coalesce", ["get", "name_en"], ["get", "name"]]
                        ],
                        ["coalesce", ["get", "name_en"], ["get", "name"]]
                    ],
                    15,
                    ["get", "ref"]
                ],
                "text-letter-spacing": 0.01,
                "text-max-width": 9
            },
            "paint": {
                "text-color": "hsl(230, 40%, 55%)",
                "text-halo-color": "rgb(255, 255, 255)",
                "text-halo-width": 1
            }
        },
        {
            "id": "settlement-subdivision-label",
            "type": "symbol",
            "metadata": {
                "mapbox:featureComponent": "place-labels",
                "mapbox:group": "Place labels, place-labels"
            },
            "source": "composite",
            "source-layer": "place_label",
            "minzoom": 10,
            "maxzoom": 15,
            "filter": [
                "all",
                [
                    "match",
                    ["get", "class"],
                    [
                        "settlement_subdivision",
                        "disputed_settlement_subdivision"
                    ],
                    ["match", ["get", "worldview"], ["all", "US"], true, false],
                    false
                ],
                ["<=", ["get", "filterrank"], 3],
                [
                    "step",
                    ["pitch"],
                    true,
                    50,
                    ["<", ["distance-from-center"], 3],
                    60,
                    ["<", ["distance-from-center"], 4],
                    70,
                    ["<", ["distance-from-center"], 5]
                ]
            ],
            "layout": {
                "text-field": ["coalesce", ["get", "name_en"], ["get", "name"]],
                "text-transform": "uppercase",
                "text-font": ["Manrope Regular", "Arial Unicode MS Regular"],
                "text-letter-spacing": [
                    "match",
                    ["get", "type"],
                    "suburb",
                    0.15,
                    0.05
                ],
                "text-max-width": 7,
                "text-padding": 3,
                "text-size": [
                    "interpolate",
                    ["cubic-bezier", 0.5, 0, 1, 1],
                    ["zoom"],
                    11,
                    ["match", ["get", "type"], "suburb", 11, 10.5],
                    15,
                    ["match", ["get", "type"], "suburb", 15, 14]
                ],
                "visibility": "none"
            },
            "paint": {
                "text-halo-color": "rgba(255, 255, 255, 0.75)",
                "text-halo-width": 1,
                "text-color": "hsl(230, 29%, 36%)",
                "text-halo-blur": 0.5
            }
        },
        {
            "id": "settlement-minor-label",
            "type": "symbol",
            "metadata": {
                "mapbox:featureComponent": "place-labels",
                "mapbox:group": "Place labels, place-labels"
            },
            "source": "composite",
            "source-layer": "place_label",
            "minzoom": 2,
            "maxzoom": 13,
            "filter": [
                "all",
                ["<=", ["get", "filterrank"], 3],
                [
                    "match",
                    ["get", "class"],
                    ["settlement", "disputed_settlement"],
                    ["match", ["get", "worldview"], ["all", "US"], true, false],
                    false
                ],
                [
                    "step",
                    ["zoom"],
                    [">", ["get", "symbolrank"], 6],
                    4,
                    [">=", ["get", "symbolrank"], 7],
                    6,
                    [">=", ["get", "symbolrank"], 8],
                    7,
                    [">=", ["get", "symbolrank"], 10],
                    10,
                    [">=", ["get", "symbolrank"], 11],
                    11,
                    [">=", ["get", "symbolrank"], 13],
                    12,
                    [">=", ["get", "symbolrank"], 15]
                ],
                [
                    "step",
                    ["pitch"],
                    true,
                    50,
                    ["<", ["distance-from-center"], 3],
                    60,
                    ["<", ["distance-from-center"], 4],
                    70,
                    ["<", ["distance-from-center"], 5]
                ]
            ],
            "layout": {
                "text-line-height": 1.1,
                "text-size": [
                    "interpolate",
                    ["cubic-bezier", 0.2, 0, 0.9, 1],
                    ["zoom"],
                    3,
                    ["step", ["get", "symbolrank"], 11, 9, 10],
                    6,
                    ["step", ["get", "symbolrank"], 14, 9, 12, 12, 10],
                    8,
                    ["step", ["get", "symbolrank"], 16, 9, 14, 12, 12, 15, 10],
                    13,
                    ["step", ["get", "symbolrank"], 22, 9, 20, 12, 16, 15, 14]
                ],
                "text-radial-offset": [
                    "step",
                    ["zoom"],
                    ["match", ["get", "capital"], 2, 0.6, 0.55],
                    8,
                    0
                ],
                "symbol-sort-key": ["get", "symbolrank"],
                "icon-image": [
                    "step",
                    ["zoom"],
                    [
                        "case",
                        ["==", ["get", "capital"], 2],
                        "border-dot-13",
                        [
                            "step",
                            ["get", "symbolrank"],
                            "dot-11",
                            9,
                            "dot-10",
                            11,
                            "dot-9"
                        ]
                    ],
                    8,
                    ""
                ],
                "text-font": ["Manrope Regular", "Arial Unicode MS Regular"],
                "text-justify": "auto",
                "visibility": "none",
                "text-anchor": [
                    "step",
                    ["zoom"],
                    ["get", "text_anchor"],
                    8,
                    "center"
                ],
                "text-field": ["coalesce", ["get", "name_en"], ["get", "name"]],
                "text-max-width": 7
            },
            "paint": {
                "text-color": "hsl(230, 29%, 0%)",
                "text-halo-color": "rgb(255, 255, 255)",
                "text-halo-width": 1,
                "text-halo-blur": 1
            }
        },
        {
            "id": "settlement-major-label",
            "type": "symbol",
            "metadata": {
                "mapbox:featureComponent": "place-labels",
                "mapbox:group": "Place labels, place-labels"
            },
            "source": "composite",
            "source-layer": "place_label",
            "minzoom": 2,
            "maxzoom": 15,
            "filter": [
                "all",
                ["<=", ["get", "filterrank"], 3],
                [
                    "match",
                    ["get", "class"],
                    ["settlement", "disputed_settlement"],
                    ["match", ["get", "worldview"], ["all", "US"], true, false],
                    false
                ],
                [
                    "step",
                    ["zoom"],
                    false,
                    2,
                    ["<=", ["get", "symbolrank"], 6],
                    4,
                    ["<", ["get", "symbolrank"], 7],
                    6,
                    ["<", ["get", "symbolrank"], 8],
                    7,
                    ["<", ["get", "symbolrank"], 10],
                    10,
                    ["<", ["get", "symbolrank"], 11],
                    11,
                    ["<", ["get", "symbolrank"], 13],
                    12,
                    ["<", ["get", "symbolrank"], 15],
                    13,
                    [">=", ["get", "symbolrank"], 11],
                    14,
                    [">=", ["get", "symbolrank"], 15]
                ],
                [
                    "step",
                    ["pitch"],
                    true,
                    50,
                    ["<", ["distance-from-center"], 3],
                    60,
                    ["<", ["distance-from-center"], 4],
                    70,
                    ["<", ["distance-from-center"], 5]
                ]
            ],
            "layout": {
                "text-line-height": 1.1,
                "text-size": [
                    "interpolate",
                    ["cubic-bezier", 0.2, 0, 0.9, 1],
                    ["zoom"],
                    3,
                    ["step", ["get", "symbolrank"], 13, 6, 11],
                    6,
                    ["step", ["get", "symbolrank"], 18, 6, 16, 7, 14],
                    8,
                    ["step", ["get", "symbolrank"], 20, 9, 16, 10, 14],
                    15,
                    ["step", ["get", "symbolrank"], 24, 9, 20, 12, 16, 15, 14]
                ],
                "text-radial-offset": [
                    "step",
                    ["zoom"],
                    ["match", ["get", "capital"], 2, 0.6, 0.55],
                    8,
                    0
                ],
                "symbol-sort-key": ["get", "symbolrank"],
                "icon-image": [
                    "step",
                    ["zoom"],
                    [
                        "case",
                        ["==", ["get", "capital"], 2],
                        "border-dot-13",
                        [
                            "step",
                            ["get", "symbolrank"],
                            "dot-11",
                            9,
                            "dot-10",
                            11,
                            "dot-9"
                        ]
                    ],
                    8,
                    ""
                ],
                "text-font": ["Manrope Medium", "Arial Unicode MS Regular"],
                "text-justify": [
                    "step",
                    ["zoom"],
                    [
                        "match",
                        ["get", "text_anchor"],
                        ["left", "bottom-left", "top-left"],
                        "left",
                        ["right", "bottom-right", "top-right"],
                        "right",
                        "center"
                    ],
                    8,
                    "center"
                ],
                "visibility": "none",
                "text-anchor": [
                    "step",
                    ["zoom"],
                    ["get", "text_anchor"],
                    8,
                    "center"
                ],
                "text-field": ["coalesce", ["get", "name_en"], ["get", "name"]],
                "text-max-width": 7
            },
            "paint": {
                "text-color": "hsl(230, 29%, 0%)",
                "text-halo-color": "rgb(255, 255, 255)",
                "text-halo-width": 1,
                "text-halo-blur": 1
            }
        },
        {
            "id": "state-label",
            "type": "symbol",
            "metadata": {
                "mapbox:featureComponent": "place-labels",
                "mapbox:group": "Place labels, place-labels"
            },
            "source": "composite",
            "source-layer": "place_label",
            "minzoom": 3,
            "maxzoom": 9,
            "filter": [
                "all",
                [
                    "match",
                    ["get", "class"],
                    ["state", "disputed_state"],
                    ["match", ["get", "worldview"], ["all", "US"], true, false],
                    false
                ],
                [
                    "step",
                    ["pitch"],
                    true,
                    50,
                    ["<", ["distance-from-center"], 3],
                    60,
                    ["<", ["distance-from-center"], 4],
                    70,
                    ["<", ["distance-from-center"], 5]
                ]
            ],
            "layout": {
                "text-size": [
                    "interpolate",
                    ["cubic-bezier", 0.85, 0.7, 0.65, 1],
                    ["zoom"],
                    4,
                    ["step", ["get", "symbolrank"], 9, 6, 8, 7, 7],
                    9,
                    ["step", ["get", "symbolrank"], 21, 6, 16, 7, 14]
                ],
                "text-transform": "uppercase",
                "text-font": ["Manrope Bold", "Arial Unicode MS Bold"],
                "text-field": ["coalesce", ["get", "name_en"], ["get", "name"]],
                "text-letter-spacing": 0.15,
                "text-max-width": 6,
                "visibility": "none"
            },
            "paint": {
                "text-color": "hsl(230, 29%, 0%)",
                "text-halo-color": "rgb(255, 255, 255)",
                "text-halo-width": 1,
                "text-opacity": 0.5
            }
        },
        {
            "id": "country-label",
            "type": "symbol",
            "metadata": {
                "mapbox:featureComponent": "place-labels",
                "mapbox:group": "Place labels, place-labels"
            },
            "source": "composite",
            "source-layer": "place_label",
            "minzoom": 1,
            "maxzoom": 10,
            "filter": [
                "all",
                [
                    "match",
                    ["get", "class"],
                    ["country", "disputed_country"],
                    ["match", ["get", "worldview"], ["all", "US"], true, false],
                    false
                ],
                [
                    "step",
                    ["pitch"],
                    true,
                    50,
                    ["<", ["distance-from-center"], 3],
                    60,
                    ["<", ["distance-from-center"], 4],
                    70,
                    ["<", ["distance-from-center"], 5]
                ]
            ],
            "layout": {
                "text-line-height": 1.1,
                "text-size": [
                    "interpolate",
                    ["cubic-bezier", 0.2, 0, 0.7, 1],
                    ["zoom"],
                    1,
                    ["step", ["get", "symbolrank"], 11, 4, 9, 5, 8],
                    9,
                    ["step", ["get", "symbolrank"], 22, 4, 19, 5, 17]
                ],
                "text-radial-offset": ["step", ["zoom"], 0.6, 8, 0],
                "icon-image": "",
                "text-font": ["Manrope Medium", "Arial Unicode MS Regular"],
                "text-justify": [
                    "step",
                    ["zoom"],
                    [
                        "match",
                        ["get", "text_anchor"],
                        ["left", "bottom-left", "top-left"],
                        "left",
                        ["right", "bottom-right", "top-right"],
                        "right",
                        "center"
                    ],
                    7,
                    "auto"
                ],
                "visibility": "none",
                "text-field": ["coalesce", ["get", "name_en"], ["get", "name"]],
                "text-max-width": 6
            },
            "paint": {
                "icon-opacity": [
                    "step",
                    ["zoom"],
                    ["case", ["has", "text_anchor"], 1, 0],
                    7,
                    0
                ],
                "text-color": "hsl(230, 29%, 0%)",
                "text-halo-color": [
                    "interpolate",
                    ["linear"],
                    ["zoom"],
                    2,
                    "rgba(255, 255, 255, 0.75)",
                    3,
                    "rgb(255, 255, 255)"
                ],
                "text-halo-width": 1.25
            }
        },
        {
            "id": "continent-label",
            "type": "symbol",
            "metadata": {
                "mapbox:featureComponent": "place-labels",
                "mapbox:group": "Place labels, place-labels"
            },
            "source": "composite",
            "source-layer": "natural_label",
            "minzoom": 0.75,
            "maxzoom": 3,
            "filter": ["==", ["get", "class"], "continent"],
            "layout": {
                "text-field": ["coalesce", ["get", "name_en"], ["get", "name"]],
                "text-line-height": 1.1,
                "text-max-width": 6,
                "text-font": ["Manrope Medium", "Arial Unicode MS Regular"],
                "text-size": [
                    "interpolate",
                    ["exponential", 0.5],
                    ["zoom"],
                    0,
                    10,
                    2.5,
                    15
                ],
                "text-transform": "uppercase",
                "text-letter-spacing": 0.05,
                "visibility": "none"
            },
            "paint": {
                "text-color": "hsl(230, 29%, 0%)",
                "text-halo-color": [
                    "interpolate",
                    ["linear"],
                    ["zoom"],
                    0,
                    "rgba(255, 255, 255, 0.75)",
                    3,
                    "rgb(255, 255, 255)"
                ],
                "text-halo-width": 1.5,
                "text-opacity": [
                    "interpolate",
                    ["linear"],
                    ["zoom"],
                    0,
                    0.8,
                    1.5,
                    0.5,
                    2.5,
                    0
                ]
            }
        }
    ],
    "created": "2023-11-17T04:42:20.125Z",
    "modified": "2023-11-17T21:46:23.204Z",
    "id": "clp24vtr000bg01rc1ix4933f",
    "owner": "vtremsin",
    "visibility": "public",
    "protected": false,
    "draft": false
}
"""
    
    static let satelliteJSONString = 
    """
        {
        "version": 8,
        "name": "Satellite Streets-copy",
        "metadata": {
            "mapbox:type": "default",
            "mapbox:origin": "satellite-streets-v12",
            "mapbox:sdk-support": {
                "js": "3.0.0",
                "android": "11.0.0",
                "ios": "11.0.0"
            },
            "mapbox:autocomposite": true,
            "mapbox:groups": {
                "Transit, transit-labels": {
                    "name": "Transit, transit-labels",
                    "collapsed": true
                },
                "Administrative boundaries, admin": {
                    "name": "Administrative boundaries, admin",
                    "collapsed": true
                },
                "Transit, bridges": {"name": "Transit, bridges", "collapsed": true},
                "Road network, bridges": {
                    "name": "Road network, bridges",
                    "collapsed": true
                },
                "Road network, tunnels": {
                    "name": "Road network, tunnels",
                    "collapsed": true
                },
                "Road network, road-labels": {
                    "name": "Road network, road-labels",
                    "collapsed": true
                },
                "Natural features, natural-labels": {
                    "name": "Natural features, natural-labels",
                    "collapsed": true
                },
                "Road network, surface": {
                    "name": "Road network, surface",
                    "collapsed": true
                },
                "Walking, cycling, etc., barriers-bridges": {
                    "name": "Walking, cycling, etc., barriers-bridges",
                    "collapsed": true
                },
                "Place labels, place-labels": {
                    "name": "Place labels, place-labels",
                    "collapsed": true
                },
                "Point of interest labels, poi-labels": {
                    "name": "Point of interest labels, poi-labels",
                    "collapsed": true
                },
                "Walking, cycling, etc., tunnels": {
                    "name": "Walking, cycling, etc., tunnels",
                    "collapsed": true
                },
                "Walking, cycling, etc., walking-cycling-labels": {
                    "name": "Walking, cycling, etc., walking-cycling-labels",
                    "collapsed": true
                },
                "Walking, cycling, etc., surface": {
                    "name": "Walking, cycling, etc., surface",
                    "collapsed": true
                },
                "Satellite imagery, land": {
                    "name": "Satellite imagery, land",
                    "collapsed": false
                },
                "Transit, ferry-aerialway-labels": {
                    "name": "Transit, ferry-aerialway-labels",
                    "collapsed": true
                }
            },
            "mapbox:thumb": "data:image/webp;base64,UklGRqogAABXRUJQVlA4WAoAAAAgAAAAOwAAOwAASUNDUMgBAAAAAAHIAAAAAAQwAABtbnRyUkdCIFhZWiAH4AABAAEAAAAAAABhY3NwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAQAA9tYAAQAAAADTLQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAlkZXNjAAAA8AAAACRyWFlaAAABFAAAABRnWFlaAAABKAAAABRiWFlaAAABPAAAABR3dHB0AAABUAAAABRyVFJDAAABZAAAAChnVFJDAAABZAAAAChiVFJDAAABZAAAAChjcHJ0AAABjAAAADxtbHVjAAAAAAAAAAEAAAAMZW5VUwAAAAgAAAAcAHMAUgBHAEJYWVogAAAAAAAAb6IAADj1AAADkFhZWiAAAAAAAABimQAAt4UAABjaWFlaIAAAAAAAACSgAAAPhAAAts9YWVogAAAAAAAA9tYAAQAAAADTLXBhcmEAAAAAAAQAAAACZmYAAPKnAAANWQAAE9AAAApbAAAAAAAAAABtbHVjAAAAAAAAAAEAAAAMZW5VUwAAACAAAAAcAEcAbwBvAGcAbABlACAASQBuAGMALgAgADIAMAAxADZWUDhMux4AAC87wA4ADXUhov8BXwMAIGm2//+oaBBQFGynzlh3XnXn0/U568M6+5x+Xk93d96di2txbW7O2Z1ggCCNd1vbHKfZtu2o2NVRrSwkwGCcrnj/utd/Fa58XY4kI0BCuVOlozDYtttIkiR8ACTN3D0iu0frmf1vSutJURUR7mZGAvgR/3Tz3093Dte3dp1xQkEVGufydE6CkjuZHrehV4zF+jSGLbg5hbUk58Ht0PBcyvHVb10/o2LUwgzw/OZubDCfG9sfJyby0ZQsuNAy35eJ1sduARyiQCgA1CEEAwHAskwTnUosHEv9IFYQxGdbT4IIwszLrWMCCoQZA3GuXUrlTcsbJ5TIdFX4Sryr9BAeIs/flQCjWZdYrYlExjUiEiO1pan+fJPh+dxqgmMKAiYkqbLRIhSDZYQKv/wut+vuiRegzlBeHINNxps4Ci6qXZd8sykAEAAEAAAAil5TA2H3IatXvDwe1oUzcYgAQCckyvNlfxUqnQeTQ+N30nyFGUJtiVI9PU+DInfHSYd4q03vbX/++pertW2Jy7VWxvRZgsGl9Q7m3y2no5ozad2T+0lhNLdnVzgBmXBtKMPOICOzfTNVwLTH57Fe1uhJn/cpo3ex26BgAAAEQBRESPGhMpyJr1cbFzrr2H6WIAcc0fLV1bI1LJm2oMrGrvmxjexiT8NYlJQoirmpim57JzRILhdYmxgdsXvfzWqMkH0MA4tlpIKaXkFDXKfXUKUEVntXCX8s7zD85dIqn54sQGV9vPpizl5LO/maHHVTYXrxrhkEDgEANcV2XM6zdWvfjjk7Tm50c8CThXh8Dhp5anyrX93OYFsv+65+Hzu7P4qj3+5UvflcLp1Xv3S0E9lToPV6HowpIcZEa+O5ke03D1vN9DMzzR25RqcbkqcMYj1LkDPX6dD8qb4TUErsquhCMufzi69DDcy/OsanzBm+QCyt2rOUdrbMjpbrKu0OwcxKv5bdfNUaXZWjvILm8uV7bW0JFeAdFjGzk2o8Ir+qwfALH/zW6q/98np4DLl2zilNhxoxyhbv5M141f+3lzpKJPXk14urBbK8tyr2bJJXdJSFJwlci4fXp/9Esft/hONDAelFkExA4PHFKm9sUXmCIp12Qa9eqK2ZfHSRnzxYIqlG1zTiNrHHbo+ygIjw5ilsA35d1z9dDDyeJcykudHDcRGg93X6Y577JbflZH5QyL99H+9qUwkJGR98vC4f22GR5K7hJJP7vTt53lnJTiuryjlgi3HxhCiRoYXS8uUFriq09/a/ThOvY1aiMbqSqpZ6ZVutrPx500B2bcynqJywXCulfcygCL6DxpsN1nYNoOUOMxDRSUw4rZ8NWytU/s3hrv73rsOhUEwIGIc+24IGnVJhvIqEy+minOiRnQpp3EFsNlU3ROlHH8OBnBxExkfp4IgcsJkreE1kxS5q3KuVQcaz4g0/yXJNKNupRRThjIzW6WTVtt2D3l51W67wuadntTxD8Z4hGYL1Be0WAYA+DxuvjYuEifFVFQhwnU0cEmFmCvC1Qpw8bcvcnxAktR4F5BczThJR2+Po4eYLuzG+dJ7kzeccxHb0kdGpblGmaZmCKcGrZtu7756YZHwc732uxctseTWWb8nt+230C89UCyCGE+gtdadGaAyP7gMNJ/RIfvpFvntqJ3F/NEsOLhODAlQcve5mQsCkrJAOCOHCir3Y2sJoVISML8yPVeYtyEwRVpi81je5SdvNRelVf2oP/q+SLXa+2IDcTwe6xurnXnoxilF1XVXwunZIVdtCj8hNMq3SgJanr2/Fj2lLfl/h1MLT9EVr7Xx9+tjDwWSu741ezQjXe431bLvdct1RrVLw3WAGEieCAVABWiNYCqMh3WIKEEEEFt6WpnOye7O1rKoYYf7wY919q3WmS/hH7/zfhrtb4rJWy8RrfvfVE67ZiEoIV8RCpq5YT67q//7nSVCMI05ttNWrvW1E8vIa+V8CR0gql53CxcKIoao+nq6z3SD57fPDO2M/wxcVGVy1wc9eN9dxL7Bj7BoFbjIjSPmBHrAAYZMQYeSDUiqMtoIj9dOvnr51rcm1Wpg21f89alv9Jw8aGl+2Up+2EYFH97nTleEE6DQCGJ0isymVD/6Q+sqaG5b25pYSnT1FKFzy4EyuV6zsJIh3bUmnB7xfyECzxQRtK+ohJ38YPyGQTKDf3/sjjafbl7vgxCVoRalllaoOUKCNCHidEAW1T6uBQoyCBiZSex5D3ZiAz/7mCw/Qi+Kh6rbyMREs3trl9g1xadjXDcfhePp2CDj8X61HZzW3dBQTUxmtG+d09DyCkzQzKoPa7FftKCPy+TLVL7V0Xsarm4sqGE6KsAdEd9C1rPCO0qtnUER2+4JrfzbPjjFf+TGpdtvuPIgrQHECUMEAJvj0hHEKS2SU0UG5thdpgWPHJ6/DeRJCnp607v8I6kLxOD1f5wf96DoftAMd5U3d/PLwJeMq9Y4dvlawkWEbvrpFZ/AS3oX8YIHBQ/uPmjSH32nvtYBYDVe/LGZudwcIqsdd9ZfouPZHQgzc+bpZi2ayrbtYg2NIyvWkXaUAgkAADExpIHlJnq3Jax8f9yRr3bCik+nLq22FNITs5rIMuLMbrlrMnVIelwXjED3XSw2v3ohl45OVvIwffVmPD64fmlsIwm+Fe6WKXJsJ93/5zX/Ad5z4YzW7vjjeGHC8sqPyOWQF12NirRlW8asczDzf2PJsyvVDIWckOYXGhjjxcOm0kKC4I0TUXKurX8nLxdPM9K/Ovm1ILIokpxnz8k//cq/vevtcpK/YuCqNucScrF0hTBSMKBBehAYhr96DVCjwETbOLrxu9b1lyOBCm22Gmuar99V5q3mtf3m7c2pY0fsH9GNEaQLU6Fp24/vaXw9PgUp7V+/dLM/goNv2uKcneSmmGDJxP3U6HAIQpOtq2MA/ycRCymtp+lxiMl6azgUDJvwG0ZUcPx+1I7lkmrq4Vd2bCl7d6Mlf08sQLlk7ms3C3dNVmU1rwPx8+9+NJW325vFJWZq5VtMk4yP5dtlofsuKWYNl2+Ion5xzIj4YrvujD3zExFo0iU0kOD67rw2R02Lzce3r8izZXSeEQS0mLl9YpZSsEFVPekzq7WUsD5oO+pyyZ49SZr4B5IpJLp4gNoFAfGfCGQ2cIMHaCssvd1yLjexDiWIiwPZDaZvdeWPjg7D2rhZSiK0tkjw4CMm9cp0pbbq4BiPmD1qb1Gqyrk57cd9j8lq6RgOw8WXmvu60eARyloyl5fFsHzA0iKiP75OuG2LtvSsg096rV+2gYDfDIuPz+CIKvv1kGtc/DTa6FP50Pf74L6T3KmkH5AW9Q5+DR5TNQo2PJHuqgbqGGRtNrPL+sSdZe3rwjLpM3ZbN4bD82hJ2wjDCQg2ocMSzW4FQfhHhtnNabNi21Fpkq8hssupPAvxdgCcQpxvOabiZoPftMkH6NX7x4RjtGA3AM7XrOsmvJ6A90mTI0e2uHJWq/2jwLf7+v7Ao2xuBbcOJO34t8XNkGyuiWBvy2+d5BhbXOJKNNDoifcG83ijbddLQOL/BDA1nkELa2HI0v9vrTk6buM4gNZXg2u5u52/7arzsQGkMR/3vhs8Wrr58pXozv91pohxdZYRl5P/+u0fATCKhdjZaq3cqMLIf+aK8zpatetzASD3597bP7YKHmXXfDIj41SFAxIc9qrpxsuz4jIc/as+QU5W4Hl5c5a3JO2ubEVb5XRMr8wNtfNiZLWo5svsOXx98K5pPhzxIAPGCkR7SZNdgmBlelVblD8/pqnc2gcHKZnMrWZrDr2conDAPOsZckDjXoXndZC0ZLPock1albg9G0sp/f/8vr+y5sM9aXd/Z6KrLqWyTkSoQD0D02vv28KvX1mTz7jneheEnE8FX2u5i3izbwGJPCXgywTOa1jqXryqbdPU6nZJHWko4w+TUN9PVd9FojBWaf2oIuw4/Us35W3O7/lu7GTxbtgEA3TqjrKtDhwJBQpkMnRo0ivD2cBoaYaa7IRdfipVh8HHbAbdv+WffnUYd231tGXaq7g7UIPu2IYWC3jurTVnt3sUJweUaZaQs1DqiG3nammFtCWlqVvZlUS13bcEqXfhZ9yfB9sToZxVGkE1Ib4ru3vgTWprqccvK+P/VeEg3qgCVM3KU1oTq9rl0j3nw6Vz4PvgqShAhvJv6I0e/7k9YfZeBHJXfj0142VEV9hMmZYNkIrXVQzEIy1MWMUh1R1KXZ7eV1u2eHFwGKFcuKV2jpUZZyxRTDtY0+rrPvtNna34Bxb7ROghxaD1Zngtk4/LfDQlz2t7/e91eL66z43h1Hd4+YgrF0Bewxj4ZKOHXPxyNfox+bx0a44FkvF3tHqS8j6ov8ZWeHrzsW5AWQ6+JqbgUB6N0KCR6YKibIe7DSV6y96KLasPh/aQABaOlW5xrrFg08TclCtW4r3fCArWFMCwYWEYmfiwsZHO0XuF/6rPZmuq19E7sA/IrBuj45mkPYUCmBG4jd3jIKWJ7Do41ycv/+P709XarH36aqqWzFscflrqvptbRQbUa6OZa7/iffS0cAF9bcRnEx/4tqA9ofMwx8AFDTobrgVCB4IZz63kArsHpy31shUp31fmuG4V6Py27iJEVwZHxYB8p+LqvSqMCydl7admb8IvMr4xREo+qb2TWjesf5uvzoRWEAI8eJgPVTpTKHHlY2+K/W7649sbyi/en9tYe9n1D9JCkSs68nnGZ+b3GY/FI8doHW510Gg9hnV7Gw4PrFQcOHAXMaEw/I4uv4e+a7sqArhEpatvIzqsG3+ubV+mK/5Q6c/uvLsnjj3H+o5/psXX3Z/DHH734Wn0vL79E81lqzyDFPsW0K0TCPmWXoF/h+CFJC7tk4GqLCMsWiQxFjBBQfzmQuh0diyFcDMu6di8nypXGRzN0EZ793kyXsdCM5k+Z8MjunL4pi1+L2UmCbpZ6/dp7KD5qDF13XcTz5RixbX6Df9gPn7S49JSBvNxJcu0+mL3a0ScLhS73vD243jr4LMKS49rr+hZIXl4lX5yUtq+pvI9lbBh2CR+PO3NUrMhBJIFe6TJAuRBEkKdF9FUaHSNpdmt3DcjDs3jmTxpW9fikXil74Q5GLH/+vnq2fA2Kt67728SuEBSJWcbL/9kTNxLJcbFpLphtq3N/RQVnB49fJlvV2fMgWSbqx8NSLCupVEVdjiCTFxd1mdg6wx+m8id7OniR/FakEqcO8JyBBzd/eJr9NF1l3ldrychpeKCHxCU47ArvaDD5qmKx7yLmWLwf4e5t2rzHRLomzxSP1lM69aB167qiQ0ViQOqo/f4zZKlxiT7H5hX1A1tvFqWD33malTzPlrOTz1fqrf33WoSgH6ghPnqrzNS1kY5vvyUH+VyRiJSOSmwPUm7RyHSzgJA9HbfwAWyNFsQX62Uma+OrvGsTc7cIC3qDeD5GGb1ckuURBd5oL8iL/Mqn02DhJbYVNaQetQ44lo/JnV3uCyavfmsd8rHBUa5NSDOJ9fl6WjYO/bY2eQU4NIKzLxfbK/X0uDwthE+g8sFaLB6r18BZ5BtHacWifFc12xxOkAEfbvtcAPqI1ypAJ+Asz0F3B2GJEE67QZjOlzNPhykXRe1bcxt19Lso1xdNHnw6IDTwSZrboSBhUi5CNF8245O2TE2XsLGtdh3GhLEUmJZkGWYzfKFNjx1L8ufvjq9Ovn+OhQ5aHgzfqrtAuB9ep6HxZb19HM+7ipDHy7i38XrFvy7MTfSw7NyP8bZ1yRFfbrNhzonqnjBFtCgmu85j3y0i99/Wr7EiMen9RuVrPY+BZX+NdfBeGABGiAmTHDlr79+szo6lfQ2PLVuYuvmLtvg/NM2d93P5XcHRK8BDtSoy+fZ2IOPs65n9y7FTy389fsM9GSeNW5WjellgrKtlfT+SlXJdtfy7I94kNTe9x5Bvc09Zxa/njoVXJUnQtq2ruqUpTIsisLFYKn57Rw9/YX34P4NTUMwksuZb3Q4AxEs7QgmORfAO44q1W+F4jR1LOw9Ov5t4VrbpvGg/AT2raNT+/1+IBINNR47eNpW64KWr4NnvwkapxJQt9RazujlOMzK3y6uPvkIknPFKW4RSr8PmmndlenPBipKirUGkiMmVd5CguQ+TdASQijim2f/Rk/JAumu5+eE27LpPmjmjjmA5z4z/fLbKt13Yv0+86UGp4YXMXmRQhPKrlaWmUGrwhttXdXKSL/a7sXNAu8uw3IyfXEy/5HZOPFK3FwpKA6yPTg1MaqijOVZjcRQah5rwcNfQbUqFdhJPkJQ7ijvdVs+y+Tj47qJ063bcShk/pxhyeBDGG0S2CQZNPRRH2Ue3QCadg5oOekd+KIaRAqG4urWxPk6mdr+XtQ5Fj+zFhSOKRdnZ7B/U4/3sdvjS3F1MpSeUBGrfJ4AIT4dycOx3lhxL3ucOLVR4DOZMdxXLsQlLLohJoZXCMomMNnLyKdxvf/cY/yvHF8HXkMeAXwSFz2tps2lUKDCcZEtE+rwGVpa5md/+rNuo7SShnLoK75SBVs9/ml9YLLK6nr/93OlDK4SGRYd7HBuTGL4Njm4e4v1lk/valsF9+Hm9tKoLH5GyUcRCMbYjIXkotn6Rtsb+n4r8X4ZOIFCMOyxhOk2waPj87r8dyv9t0a7njszMDs+LPK3cbdPdpqhmMU+ZL3Zw5SrZ/VjLa788huOG4oOicvBpKgS1Ox/6dweaZLJ67PvFVHw8n/a+6enFD8FLMqHAJyX2gb/D+hWy8bzE5kUxcc3fJR2luO2DFw9T/aLuCbZ2RDZ88ck/Z2nNsd9DRUj2vSACEipMgAFvK3ooFkFrL0j2Ks7hJv2tGw73nTA1eja4HN7IqNL6QUL2XaRPnK61mY01Fh4E2X2mCHo8a2QlB407jIqe0+5n7k5DQ3UA6fOcVVLZbk70dvdyJ8Rr512AotxVt2UuY8kgLRN+ipBs3QBXkPwpQ0zjoqeYDSHnkB7ShgicKI/rVZxDE12DYFI7c6l/9T4ZcDRIc0zwtf/Hetx7kK6NDT7Z1ebmr9T591Ee7qv0Gbm4/aNusEs+LBb7KR8bTdCFhi2W8E0uN0eOdxIoGUwLivQn8+enyy3oNZbl/f149WFG07o/CH2oFIkpihCq3tTUrDVRHuZ+0QYuJLC4Ys/X2JKAZhOGqAw0aS5ZgRAv4NHDQnEfnL1Ooo+RsOmY+yy+/z4WTr3KhcVPY3ptTUR8DvrUiYakuepmbeTyrHXtDyE/Csi0oREuK9hfhUd9v5Hv+6WhiamG0sUJ5feNJP3hXsVN0XvxRMTbZtK+IFPSta0aK0TwomJo3CIxDIqtyC+rmU5OydyyxdnTbdA4AroIGeSGkLkXVS3U56G7rmJwwLBFQnuLxAdRygWqvCDUBN9qj3uaXzfdTEdzYkox6N7Le4XWd5s3vWYESoLdgr0a/JNguWWvwjsSUguMGaQVTqJcqeLqRY9KAGAtzAvhpevR9Aoll9sKBuUirJp8z9y41FnZokwuKnACENVpWDZI1xVLzcViGKi2BKnCVq9WzfBlUvwXSne8XFxjG288bmBgrXtRPhzQQmOc0iPsrdVu+SUWBQjV2hgcoVFrNjk+ifu+SYM5r3MtRsc7JKEA9pTZ3Aw0CKvk6COp2Q2G7DVCgwR44ZBpMv6NPJFQFwcCPr3My02f4mlhgYRIaEJg2ZXjaHte/k02qz3j703xiXAeXgQAIq6s+uo0UZUcN0eZI8OJGdRVfh/pYbBYWsSVs9d5/OdX+4UUnsZKBtthaffeKT8aZvWNaKHevuXv5GU6X3S6AAZCMpQY6zpJHiQCsqAST8uVrEbTZustLfP/dAKOsBfIhWmXwxtECqAFBR0YzDRTcbSstaOgqj8GlJAya0YiHAh3PVAVx9meBJJhZTMSYuNxI+Oa02sQawbru0c1nFwZiUoNxKRnYDcoNjWwDadNDef6VeIFpklMq9piNSKun+hQQEIQmW5KT0xJe93FsNZNumlKjjNMuhVj7dluFN/EkCCCoA1jGhaWb8JEwUGOg8h9a/TP0EX5ddbvWs/cYuqYYq0nhflApN/h3c0fKfPqildizoFV1jTYPzYFYgxQy9GYQVnW2VxXdX4aSpRbZ1Goe72dGvY+WhvVahVn2sPFI3Y4VUwPjYuWmOVP5V4uTqIVByRZNAQ1IavljBXdCcIwWxscemUfDZoZVqmSz+jCFkdYSe1R/Lb1mt3x9PIqdaBDPtZKenLsAZkrNj2vKnUJjpfa3zOZtDcJvveMf1rZJMQ3nP3PGBy4TMdRLT2sUq9NpxJPSfr2fISIC+NCUSICAvev9w3UfL9kTr4CLQDMBthD13WTcQYYkvaB0iKIzWuZWRFDB3HSLEdeizulIh7HrrWW5gcYu95tUWo31cpmzoR9Hrzhz3vDV2fz3S2mTmAOD84mJ9mbE7DJoSjbENf7IZjBivY55UCRbU81ANOt1cKSBLhoRLIinm2J/j7Xh8+LTkzC7ACrWl3x3QygmhdCNaLmu1PYIKz0Zlcqdk9SYqN1Mzg++RVeJMpr50Nunh1j92WZjsE4SnczkGB02IpfL9UQCv2g27+tl4++z5AFyPBIwpBm2/ungbEkZqzu5df+XNc/2T0qBxj73m4FEBjqyEQ6Cmk7Bzy07rWHN2r4e8UkG0RHEOquI+n2iFKt+rXJZDPtVx0HRkyKCJRRw+Sg+OD9vhpPqVMIE4koxc0uW0StwYuJpx0G2+xdilaQ832qX3/vM2LumBb9iNxIOGK05r89dA46RtOBSWS5v5DyHn7iNvECbqa8Zcxz5pOTsAMDqI+ujMqj1sfykFpPERU8h4awC8DMAAFF46eyPm35OtNMxK4mzIdC28BPnHaQgGZW6FqCzojrb0gPM3v7Vo50Z4BNrG9/j3qjDRfoU/MLRVKX6PxR5f1P0bcr/whA9pl4C3WXlcwfnl+ftraey9/9zxEHAAHRxuKXT75KdU8rKXXkmpuJmsgK8pJJSvR116zVvAeYyZYEc2+SvIkcyqbkolPW7BBVztxiw1dAHM0ao67pFCjRmdvKOppHfPPDQbHW34lDIOWIljnvWhC2ieZDVV2tDuFnA5mm5Suhb/v94RElGRucXZtFYVktV7+hoWgBp/QR4DVqjkLbE6J0FHdzu5PPIHEa9rF6kihKQEy1SWNzBEpMATRRj+SsGIflflfHLMgONTA7+fQVHUj4S93+wxwDSzrCkO21KokI6VV9iQ83uDxUBnqeaJb4yfrauzhBkv6BvLgOoGPud1uEbxByql9DUYlLmRiKncwPnaCAXFiXn7K5ghQiETZiq5W6PIOg6V50K0Y9EIGWNdIJSIEHmRLuqKhZCtZpxsrRxp4BdlnxpOcSz1B9cu2QbhiAv1yh8QLPznCkxGozVrHh9C31VHfOCamVvThyt7cNulliCntEB8EK+KE/uR3zz8PLdXmwuJTrryId3Jb5R6OVI8wTIUUC3kIqnzrDSGC8PBIEpdNJ18UCbYtrQwMgRQhBeVY19yTVkGT4VicX5yPL3zrJSWRlAoOcAd9QiglGGydKHWWmMYJaWq6w6Ox0xR80OU6vsAZT9/BlHl1tb1uKq6iXWwRoi8Br7KrN9HUvvrmXx8Y87Z2I8j8NU9e1MRE/YOrKEo+bw0m7eKm8zbLegpT6umD3dGt6QYEOQwXr1+KroEGCZWD8vT2CHZgCxWjGFkmrqnx110ndEBKIbYXd3drFkxbDJUUkbtggQv7u8+NPpkf5RaID8ZXgkpwnFQZv7JptthAbfQwii+2raHlBCefLbwDzOb+Wx5nKbL6ytoVl5ePIB93lAr7IWs1UAMQrQ2X8dN8RaAtMgCgr1x8M51d7PVUKG//ssFStFhf3InwyuidIL4yHpnUi0SD6QU/89t+xordCEj4AJmASnRL94+GVcFpMqroxf6of3kw0LXh0gWJVGvWL+nl5/VfdsDR3t/XJ3ubB/JgyiilSHKTfAzkgA0DN7sV8EwtgNCQFp/EUhEbiqCKAA1qivPHxdFI/T3cQm/KTvSzDN6f/u6Sz1YhXaYA73/kSX5cY4AUqa0lNzX6DG8pFyICyKpqmdczCnozQTScBNZX/VUxuiyAwQCTRsLyqO2Kj8gDwlUvNfZwdoOKrsyk43P/wmBPA33KOlJAP2UPh53dtOqSomEoXQt1MEJZbnXBbFWb6QiMx+MDsJtntONVzW4GPjM4KOYH/YarTJbaaVqOkF3701HxxCYPpkvztsYlEtIrGNQoa9Po6frzpEyF32UuqalTBjhGJcXGAF2ihx4VPtmJ6fQV/Phz8NnXRDsCovOmz/ryjKFUPhAQgjzvNGE80wZdvdKPZ1CiAw/lrveuy8VVu3pIYbdeVE8SZlM6oQJCrf/uyNwRVxOjxxbIYkRvRdKD2zhvRG+utKrSy4r6F+1oMGxS1WFjjy+Uc9h9mkt/M3kHXhmyvk4pvol+WXUvEkDBkUrfxL7lYR5+m2cq3P5upW5C1KQkA",
            "mapbox:uiParadigm": "layers",
            "mapbox:decompiler": {
                "id": "clrfy98fi004z01r62jmd473v",
                "componentVersion": "18.0.0",
                "strata": [
                    {
                        "id": "satellite-streets-v12",
                        "order": [
                            ["transit", "built"],
                            ["satellite", "land"],
                            ["walking-cycling", "tunnels"],
                            ["road-network", "tunnels"],
                            ["walking-cycling", "surface"],
                            ["road-network", "surface"],
                            ["transit", "surface"],
                            ["walking-cycling", "barriers-bridges"],
                            ["road-network", "bridges"],
                            ["transit", "bridges"],
                            ["admin-boundaries", "admin"],
                            ["road-network", "road-labels"],
                            ["walking-cycling", "walking-cycling-labels"],
                            ["transit", "ferry-aerialway-labels"],
                            ["natural-features", "natural-labels"],
                            ["point-of-interest-labels", "poi-labels"],
                            ["transit", "transit-labels"],
                            ["place-labels", "place-labels"]
                        ]
                    }
                ],
                "overrides": {
                    "satellite": {
                        "satellite": {"paint": {"raster-opacity": 0.84}},
                        "background": {"paint": {"background-color": "#ffffff"}}
                    }
                },
                "components": {
                    "satellite": "18.0.0",
                    "road-network": "18.0.0",
                    "walking-cycling": "18.0.0",
                    "admin-boundaries": "18.0.0",
                    "natural-features": "18.0.0",
                    "point-of-interest-labels": "18.0.0",
                    "transit": "18.0.0",
                    "place-labels": "18.0.0"
                },
                "propConfig": {
                    "satellite": {"satelliteStyle": "Standard"},
                    "road-network": {
                        "roadsFont": [
                            "Manrope Regular",
                            "Arial Unicode MS Regular"
                        ],
                        "colorRoad": "hsla(0, 0%, 80%, 0.8)",
                        "iconSaturation": -0.5,
                        "construction": false,
                        "colorRoadLabel": "hsl(0, 0%, 100%)",
                        "fadeOutRoadsOnZoom": true,
                        "colorBase": "hsl(0, 0%, 0%)",
                        "roadsSize": 1.1,
                        "colorMotorwayTrunk": "rgba(229, 239, 255, 0.8)",
                        "polygonFeatures": false,
                        "shieldsFont": ["Manrope Bold", "Arial Unicode MS Bold"],
                        "colorPathOutline": "hsla(40, 95%, 90%, 0.8)",
                        "roadMarkings": false,
                        "turningCircles": false,
                        "colorRoadOutline": "hsla(0, 1%, 10%, 0.7)"
                    },
                    "walking-cycling": {
                        "roadsFont": [
                            "Manrope Regular",
                            "Arial Unicode MS Regular"
                        ],
                        "colorRoad": "hsla(0, 0%, 80%, 0.8)",
                        "golfHoleLabelLine": false,
                        "colorGreenspace": "hsl(94, 100%, 14%)",
                        "colorPoi": "hsl(0, 0%, 100%)",
                        "colorPoiParkLike": "hsl(110, 100%, 80%)",
                        "fadeOutPathsOnZoom": true,
                        "walkingCyclingPisteBackground": false,
                        "colorRoadLabel": "hsl(0, 0%, 100%)",
                        "colorBase": "hsl(0, 0%, 0%)",
                        "roadsSize": 1.1,
                        "poiEtcFont": ["Manrope Medium", "Arial Unicode MS Bold"],
                        "colorPathOutline": "hsla(40, 95%, 90%, 0.8)",
                        "pedestrianPolygonFeatures": false,
                        "colorRoadOutline": "hsla(0, 1%, 10%, 0.7)",
                        "labels": true
                    },
                    "admin-boundaries": {
                        "admin0Width": 1.5,
                        "colorBase": "hsl(0, 0%, 0%)",
                        "colorAdminBoundary": "hsl(260, 15%, 80%)",
                        "admin0DashPattern": "Dash on zoom"
                    },
                    "natural-features": {
                        "poiEtcFont": ["Manrope Medium", "Arial Unicode MS Bold"],
                        "colorBase": "hsl(0, 0%, 0%)",
                        "colorWater": "hsl(240, 100%, 62%)",
                        "colorPoi": "hsl(0, 0%, 100%)",
                        "labelHalo": true,
                        "poiIconScale": 0.8,
                        "waterLabelsFont": [
                            "Manrope Light",
                            "Arial Unicode MS Regular"
                        ]
                    },
                    "point-of-interest-labels": {
                        "poiIconBackground": "Circle",
                        "poiEtcFont": ["Manrope Medium", "Arial Unicode MS Bold"],
                        "colorBase": "hsl(0, 0%, 0%)",
                        "colorPoi": "hsl(0, 0%, 100%)",
                        "colorPoiParkLike": "hsl(110, 100%, 80%)",
                        "colorPoiMedical": "hsl(360, 100%, 80%)",
                        "colorPoiEducation": "hsl(30, 100%, 80%)",
                        "poiIconScale": 0.8
                    },
                    "transit": {
                        "matchLabelAndIcon": false,
                        "roadsFont": [
                            "Manrope Regular",
                            "Arial Unicode MS Regular"
                        ],
                        "aeroways": false,
                        "poiIconScale": 0.8,
                        "colorPoi": "hsl(0, 0%, 100%)",
                        "colorAirport": "hsl(0, 0%, 100%)",
                        "colorTransit": "hsl(204, 100%, 80%)",
                        "poiIconBackground": "Rectangle",
                        "colorBase": "hsl(0, 0%, 0%)",
                        "colorWater": "hsl(240, 100%, 62%)",
                        "roadsSize": 1.1,
                        "railways": false,
                        "ferries": false,
                        "poiEtcFont": ["Manrope Medium", "Arial Unicode MS Bold"],
                        "colorRoadOutline": "hsla(0, 1%, 10%, 0.7)"
                    },
                    "place-labels": {
                        "continentsSize": 1.1,
                        "countriesFont": [
                            "Manrope Medium",
                            "Arial Unicode MS Regular"
                        ],
                        "statesSize": 1.1,
                        "settlementsMinorSize": 1.1,
                        "continentsFont": [
                            "Manrope Medium",
                            "Arial Unicode MS Regular"
                        ],
                        "settlementsMajorSize": 1.1,
                        "colorPlaceLabel": "hsl(0, 0%, 100%)",
                        "settlementSubdivisionsSize": 1.1,
                        "statesFont": ["Manrope Bold", "Arial Unicode MS Bold"],
                        "colorBase": "hsl(0, 0%, 0%)",
                        "countriesSize": 1.1,
                        "settlementsMinorFont": [
                            "Manrope Regular",
                            "Arial Unicode MS Regular"
                        ],
                        "settlementsMajorFont": [
                            "Manrope Medium",
                            "Arial Unicode MS Regular"
                        ],
                        "settlementSubdivisionsFont": [
                            "Manrope Regular",
                            "Arial Unicode MS Regular"
                        ]
                    }
                }
            }
        },
        "center": [55.145841060494405, 25.056301041394917],
        "zoom": 16.01621004250655,
        "bearing": 0,
        "pitch": 0,
        "fog": {
            "range": [1, 10],
            "color": [
                "interpolate",
                ["exponential", 1.2],
                ["zoom"],
                5.5,
                "hsl(240, 12%, 70%)",
                6,
                "hsl(0, 0%, 100%)"
            ],
            "high-color": [
                "interpolate",
                ["exponential", 1.2],
                ["zoom"],
                5.5,
                "hsl(240, 12%, 7%)",
                6,
                "hsl(38, 63%, 84%)"
            ],
            "space-color": [
                "interpolate",
                ["exponential", 1.2],
                ["zoom"],
                5.5,
                "hsl(240, 12%, 9%)",
                6,
                "hsl(199, 61%, 80%)"
            ],
            "horizon-blend": [
                "interpolate",
                ["exponential", 1.2],
                ["zoom"],
                5.5,
                0.008,
                6,
                0.15
            ],
            "star-intensity": [
                "interpolate",
                ["exponential", 1.2],
                ["zoom"],
                5.5,
                0.1,
                6,
                0
            ]
        },
        "sources": {
            "mapbox://mapbox.satellite": {
                "url": "mapbox://mapbox.satellite",
                "type": "raster",
                "tileSize": 256
            },
            "composite": {
                "url": "mapbox://mapbox.mapbox-streets-v8",
                "type": "vector"
            }
        },
        "sprite": "mapbox://sprites/vtremsin/clrfz30iw005401rdb6rp11tt/8yk2525y03fukwc3efk206uid",
        "glyphs": "mapbox://fonts/mapbox/{fontstack}/{range}.pbf",
        "projection": {"name": "globe"},
        "layers": [
            {
                "id": "background",
                "type": "background",
                "metadata": {
                    "mapbox:featureComponent": "satellite",
                    "mapbox:group": "Satellite imagery, land"
                },
                "layout": {},
                "paint": {"background-color": "#ffffff"}
            },
            {
                "id": "satellite",
                "type": "raster",
                "metadata": {
                    "mapbox:featureComponent": "satellite",
                    "mapbox:group": "Satellite imagery, land"
                },
                "source": "mapbox://mapbox.satellite",
                "layout": {},
                "paint": {"raster-opacity": 0.84}
            },
            {
                "id": "tunnel-path",
                "type": "line",
                "metadata": {
                    "mapbox:featureComponent": "walking-cycling",
                    "mapbox:group": "Walking, cycling, etc., tunnels"
                },
                "source": "composite",
                "source-layer": "road",
                "minzoom": 15,
                "filter": [
                    "all",
                    ["==", ["get", "structure"], "tunnel"],
                    ["==", ["get", "class"], "path"],
                    ["!=", ["get", "type"], "steps"],
                    ["==", ["geometry-type"], "LineString"]
                ],
                "layout": {},
                "paint": {
                    "line-width": [
                        "interpolate",
                        ["exponential", 1.5],
                        ["zoom"],
                        15,
                        1,
                        18,
                        4
                    ],
                    "line-color": "hsla(40, 88%, 77%, 0.8)",
                    "line-opacity": [
                        "interpolate",
                        ["linear"],
                        ["zoom"],
                        17,
                        1,
                        18,
                        0
                    ],
                    "line-dasharray": [
                        "step",
                        ["zoom"],
                        ["literal", [1, 0]],
                        15,
                        ["literal", [1.75, 1]],
                        16,
                        ["literal", [1, 0.75]],
                        17,
                        ["literal", [1, 0.5]]
                    ]
                }
            },
            {
                "id": "tunnel-steps",
                "type": "line",
                "metadata": {
                    "mapbox:featureComponent": "walking-cycling",
                    "mapbox:group": "Walking, cycling, etc., tunnels"
                },
                "source": "composite",
                "source-layer": "road",
                "minzoom": 15,
                "filter": [
                    "all",
                    ["==", ["get", "structure"], "tunnel"],
                    ["==", ["get", "type"], "steps"],
                    ["==", ["geometry-type"], "LineString"]
                ],
                "paint": {
                    "line-width": [
                        "interpolate",
                        ["exponential", 1.5],
                        ["zoom"],
                        15,
                        1,
                        16,
                        1.6,
                        18,
                        6
                    ],
                    "line-color": "hsla(40, 88%, 77%, 0.8)",
                    "line-opacity": [
                        "interpolate",
                        ["linear"],
                        ["zoom"],
                        17,
                        1,
                        18,
                        0
                    ],
                    "line-dasharray": [
                        "step",
                        ["zoom"],
                        ["literal", [1, 0]],
                        15,
                        ["literal", [1.75, 1]],
                        16,
                        ["literal", [1, 0.75]],
                        17,
                        ["literal", [0.3, 0.3]]
                    ]
                }
            },
            {
                "id": "tunnel-pedestrian",
                "type": "line",
                "metadata": {
                    "mapbox:featureComponent": "walking-cycling",
                    "mapbox:group": "Walking, cycling, etc., tunnels"
                },
                "source": "composite",
                "source-layer": "road",
                "minzoom": 15,
                "filter": [
                    "all",
                    ["==", ["get", "structure"], "tunnel"],
                    ["==", ["get", "class"], "pedestrian"],
                    ["==", ["geometry-type"], "LineString"]
                ],
                "paint": {
                    "line-width": [
                        "interpolate",
                        ["exponential", 1.5],
                        ["zoom"],
                        14,
                        0.5,
                        18,
                        12
                    ],
                    "line-color": "hsla(40, 95%, 90%, 0.8)",
                    "line-opacity": [
                        "interpolate",
                        ["linear"],
                        ["zoom"],
                        17,
                        1,
                        18,
                        0
                    ],
                    "line-dasharray": [
                        "step",
                        ["zoom"],
                        ["literal", [2, 0.3]],
                        15,
                        ["literal", [1, 0.3]],
                        16,
                        ["literal", [1, 0.3]],
                        17,
                        ["literal", [1, 0.25]]
                    ]
                }
            },
            {
                "id": "tunnel-minor-case",
                "type": "line",
                "metadata": {
                    "mapbox:featureComponent": "road-network",
                    "mapbox:group": "Road network, tunnels"
                },
                "source": "composite",
                "source-layer": "road",
                "minzoom": 13,
                "filter": [
                    "all",
                    ["==", ["get", "structure"], "tunnel"],
                    [
                        "match",
                        ["get", "class"],
                        ["track"],
                        true,
                        "service",
                        ["step", ["zoom"], false, 14, true],
                        false
                    ],
                    ["==", ["geometry-type"], "LineString"]
                ],
                "paint": {
                    "line-width": [
                        "interpolate",
                        ["exponential", 1.5],
                        ["zoom"],
                        14,
                        0.8,
                        22,
                        2
                    ],
                    "line-color": "hsla(0, 0%, 0%, 0.7)",
                    "line-gap-width": [
                        "interpolate",
                        ["exponential", 1.5],
                        ["zoom"],
                        14,
                        1,
                        18,
                        10,
                        22,
                        100
                    ],
                    "line-opacity": [
                        "interpolate",
                        ["linear"],
                        ["zoom"],
                        13,
                        1,
                        15,
                        0
                    ],
                    "line-dasharray": [3, 3]
                }
            },
            {
                "id": "tunnel-street-case",
                "type": "line",
                "metadata": {
                    "mapbox:featureComponent": "road-network",
                    "mapbox:group": "Road network, tunnels"
                },
                "source": "composite",
                "source-layer": "road",
                "minzoom": 14,
                "filter": [
                    "all",
                    ["==", ["get", "structure"], "tunnel"],
                    [
                        "match",
                        ["get", "class"],
                        ["street", "street_limited"],
                        true,
                        false
                    ],
                    ["==", ["geometry-type"], "LineString"]
                ],
                "paint": {
                    "line-width": [
                        "interpolate",
                        ["exponential", 1.5],
                        ["zoom"],
                        14,
                        0.8,
                        22,
                        2
                    ],
                    "line-color": "hsla(0, 0%, 0%, 0.7)",
                    "line-gap-width": [
                        "interpolate",
                        ["exponential", 1.5],
                        ["zoom"],
                        12,
                        0.5,
                        18,
                        20,
                        22,
                        200
                    ],
                    "line-opacity": [
                        "interpolate",
                        ["linear"],
                        ["zoom"],
                        13,
                        1,
                        15,
                        0
                    ],
                    "line-dasharray": [3, 3]
                }
            },
            {
                "id": "tunnel-minor-link-case",
                "type": "line",
                "metadata": {
                    "mapbox:featureComponent": "road-network",
                    "mapbox:group": "Road network, tunnels"
                },
                "source": "composite",
                "source-layer": "road",
                "minzoom": 13,
                "filter": [
                    "all",
                    [
                        "match",
                        ["get", "class"],
                        ["primary_link", "secondary_link", "tertiary_link"],
                        true,
                        false
                    ],
                    ["==", ["get", "structure"], "tunnel"],
                    ["==", ["geometry-type"], "LineString"]
                ],
                "layout": {
                    "line-cap": ["step", ["zoom"], "butt", 14, "round"],
                    "line-join": ["step", ["zoom"], "miter", 14, "round"]
                },
                "paint": {
                    "line-width": [
                        "interpolate",
                        ["exponential", 1.5],
                        ["zoom"],
                        14,
                        0.8,
                        22,
                        2
                    ],
                    "line-color": "hsla(0, 1%, 10%, 0.7)",
                    "line-gap-width": [
                        "interpolate",
                        ["exponential", 1.5],
                        ["zoom"],
                        12,
                        0.4,
                        18,
                        18,
                        22,
                        180
                    ],
                    "line-opacity": [
                        "interpolate",
                        ["linear"],
                        ["zoom"],
                        13,
                        1,
                        15,
                        0
                    ]
                }
            },
            {
                "id": "tunnel-secondary-tertiary-case",
                "type": "line",
                "metadata": {
                    "mapbox:featureComponent": "road-network",
                    "mapbox:group": "Road network, tunnels"
                },
                "source": "composite",
                "source-layer": "road",
                "minzoom": 11,
                "filter": [
                    "all",
                    ["==", ["get", "structure"], "tunnel"],
                    [
                        "match",
                        ["get", "class"],
                        ["secondary", "tertiary"],
                        true,
                        false
                    ],
                    ["==", ["geometry-type"], "LineString"]
                ],
                "paint": {
                    "line-width": [
                        "interpolate",
                        ["exponential", 1.5],
                        ["zoom"],
                        14,
                        1,
                        22,
                        2
                    ],
                    "line-color": "hsla(0, 0%, 0%, 0.7)",
                    "line-gap-width": [
                        "interpolate",
                        ["exponential", 1.5],
                        ["zoom"],
                        3,
                        0,
                        18,
                        26,
                        22,
                        260
                    ],
                    "line-dasharray": [3, 3],
                    "line-opacity": [
                        "interpolate",
                        ["linear"],
                        ["zoom"],
                        13,
                        0.3,
                        15,
                        0
                    ]
                }
            },
            {
                "id": "tunnel-primary-case",
                "type": "line",
                "metadata": {
                    "mapbox:featureComponent": "road-network",
                    "mapbox:group": "Road network, tunnels"
                },
                "source": "composite",
                "source-layer": "road",
                "minzoom": 10,
                "filter": [
                    "all",
                    ["==", ["get", "structure"], "tunnel"],
                    ["==", ["get", "class"], "primary"],
                    ["==", ["geometry-type"], "LineString"]
                ],
                "paint": {
                    "line-width": [
                        "interpolate",
                        ["exponential", 1.5],
                        ["zoom"],
                        14,
                        1,
                        22,
                        2
                    ],
                    "line-color": "hsla(0, 0%, 0%, 0.7)",
                    "line-gap-width": [
                        "interpolate",
                        ["exponential", 1.5],
                        ["zoom"],
                        3,
                        0.8,
                        18,
                        28,
                        22,
                        280
                    ],
                    "line-dasharray": [3, 3],
                    "line-opacity": [
                        "interpolate",
                        ["linear"],
                        ["zoom"],
                        13,
                        0.3,
                        15,
                        0
                    ]
                }
            },
            {
                "id": "tunnel-major-link-case",
                "type": "line",
                "metadata": {
                    "mapbox:featureComponent": "road-network",
                    "mapbox:group": "Road network, tunnels"
                },
                "source": "composite",
                "source-layer": "road",
                "minzoom": 12,
                "filter": [
                    "all",
                    ["==", ["get", "structure"], "tunnel"],
                    [
                        "match",
                        ["get", "class"],
                        ["motorway_link", "trunk_link"],
                        true,
                        false
                    ],
                    ["==", ["geometry-type"], "LineString"]
                ],
                "paint": {
                    "line-width": [
                        "interpolate",
                        ["exponential", 1.5],
                        ["zoom"],
                        14,
                        0.8,
                        22,
                        2
                    ],
                    "line-color": "hsla(0, 0%, 80%, 0.8)",
                    "line-gap-width": [
                        "interpolate",
                        ["exponential", 1.5],
                        ["zoom"],
                        12,
                        0.8,
                        18,
                        20,
                        22,
                        200
                    ],
                    "line-dasharray": [3, 3],
                    "line-opacity": [
                        "interpolate",
                        ["linear"],
                        ["zoom"],
                        13,
                        1,
                        15,
                        0
                    ]
                }
            },
            {
                "id": "tunnel-motorway-trunk-case",
                "type": "line",
                "metadata": {
                    "mapbox:featureComponent": "road-network",
                    "mapbox:group": "Road network, tunnels"
                },
                "source": "composite",
                "source-layer": "road",
                "minzoom": 13,
                "filter": [
                    "all",
                    ["==", ["get", "structure"], "tunnel"],
                    ["match", ["get", "class"], ["motorway", "trunk"], true, false],
                    ["==", ["geometry-type"], "LineString"]
                ],
                "paint": {
                    "line-width": [
                        "interpolate",
                        ["exponential", 1.5],
                        ["zoom"],
                        14,
                        1,
                        22,
                        2
                    ],
                    "line-color": "hsla(0, 1%, 22%, 0.7)",
                    "line-gap-width": [
                        "interpolate",
                        ["exponential", 1.5],
                        ["zoom"],
                        3,
                        0.8,
                        18,
                        30,
                        22,
                        300
                    ],
                    "line-dasharray": [3, 3],
                    "line-opacity": [
                        "interpolate",
                        ["linear"],
                        ["zoom"],
                        13,
                        1,
                        15,
                        0
                    ]
                }
            },
            {
                "id": "tunnel-minor",
                "type": "line",
                "metadata": {
                    "mapbox:featureComponent": "road-network",
                    "mapbox:group": "Road network, tunnels"
                },
                "source": "composite",
                "source-layer": "road",
                "minzoom": 13,
                "filter": [
                    "all",
                    ["==", ["get", "structure"], "tunnel"],
                    [
                        "match",
                        ["get", "class"],
                        ["track"],
                        true,
                        "service",
                        ["step", ["zoom"], false, 14, true],
                        false
                    ],
                    ["==", ["geometry-type"], "LineString"]
                ],
                "paint": {
                    "line-width": [
                        "interpolate",
                        ["exponential", 1.5],
                        ["zoom"],
                        14,
                        1,
                        18,
                        10,
                        22,
                        100
                    ],
                    "line-color": [
                        "match",
                        ["get", "class"],
                        "street_limited",
                        "hsl(0, 2%, 22%)",
                        "hsla(0, 0%, 80%, 0.8)"
                    ],
                    "line-opacity": [
                        "interpolate",
                        ["linear"],
                        ["zoom"],
                        13,
                        1,
                        15,
                        0
                    ]
                }
            },
            {
                "id": "tunnel-minor-link",
                "type": "line",
                "metadata": {
                    "mapbox:featureComponent": "road-network",
                    "mapbox:group": "Road network, tunnels"
                },
                "source": "composite",
                "source-layer": "road",
                "minzoom": 13,
                "filter": [
                    "all",
                    [
                        "match",
                        ["get", "class"],
                        ["primary_link", "secondary_link", "tertiary_link"],
                        true,
                        false
                    ],
                    ["==", ["get", "structure"], "tunnel"],
                    ["==", ["geometry-type"], "LineString"]
                ],
                "layout": {
                    "line-cap": ["step", ["zoom"], "butt", 13, "round"],
                    "line-join": ["step", ["zoom"], "miter", 13, "round"]
                },
                "paint": {
                    "line-width": [
                        "interpolate",
                        ["exponential", 1.5],
                        ["zoom"],
                        12,
                        0.4,
                        18,
                        18,
                        22,
                        180
                    ],
                    "line-color": "hsla(0, 0%, 80%, 0.8)",
                    "line-opacity": [
                        "interpolate",
                        ["linear"],
                        ["zoom"],
                        13,
                        1,
                        15,
                        0
                    ]
                }
            },
            {
                "id": "tunnel-major-link",
                "type": "line",
                "metadata": {
                    "mapbox:featureComponent": "road-network",
                    "mapbox:group": "Road network, tunnels"
                },
                "source": "composite",
                "source-layer": "road",
                "minzoom": 12,
                "filter": [
                    "all",
                    ["==", ["get", "structure"], "tunnel"],
                    [
                        "match",
                        ["get", "class"],
                        ["motorway_link", "trunk_link"],
                        true,
                        false
                    ],
                    ["==", ["geometry-type"], "LineString"]
                ],
                "paint": {
                    "line-width": [
                        "interpolate",
                        ["exponential", 1.5],
                        ["zoom"],
                        12,
                        0.8,
                        18,
                        20,
                        22,
                        200
                    ],
                    "line-color": "rgba(255, 255, 255, 0.8)",
                    "line-opacity": [
                        "interpolate",
                        ["linear"],
                        ["zoom"],
                        13,
                        1,
                        15,
                        0
                    ]
                }
            },
            {
                "id": "tunnel-street",
                "type": "line",
                "metadata": {
                    "mapbox:featureComponent": "road-network",
                    "mapbox:group": "Road network, tunnels"
                },
                "source": "composite",
                "source-layer": "road",
                "minzoom": 13,
                "filter": [
                    "all",
                    ["==", ["get", "structure"], "tunnel"],
                    [
                        "match",
                        ["get", "class"],
                        ["street", "street_limited"],
                        true,
                        false
                    ],
                    ["==", ["geometry-type"], "LineString"]
                ],
                "paint": {
                    "line-width": [
                        "interpolate",
                        ["exponential", 1.5],
                        ["zoom"],
                        12,
                        0.5,
                        18,
                        20,
                        22,
                        200
                    ],
                    "line-color": [
                        "match",
                        ["get", "class"],
                        "street_limited",
                        "hsl(0, 2%, 22%)",
                        "hsla(0, 0%, 80%, 0.8)"
                    ],
                    "line-opacity": [
                        "interpolate",
                        ["linear"],
                        ["zoom"],
                        13,
                        1,
                        15,
                        0
                    ]
                }
            },
            {
                "id": "tunnel-street-low",
                "type": "line",
                "metadata": {
                    "mapbox:featureComponent": "road-network",
                    "mapbox:group": "Road network, tunnels"
                },
                "source": "composite",
                "source-layer": "road",
                "minzoom": 13,
                "maxzoom": 14,
                "filter": [
                    "all",
                    ["==", ["get", "structure"], "tunnel"],
                    [
                        "match",
                        ["get", "class"],
                        ["street", "street_limited"],
                        true,
                        false
                    ],
                    ["==", ["geometry-type"], "LineString"]
                ],
                "layout": {
                    "line-cap": ["step", ["zoom"], "butt", 14, "round"],
                    "line-join": ["step", ["zoom"], "miter", 14, "round"]
                },
                "paint": {
                    "line-width": [
                        "interpolate",
                        ["exponential", 1.5],
                        ["zoom"],
                        12,
                        0.5,
                        18,
                        20,
                        22,
                        200
                    ],
                    "line-color": "hsla(0, 0%, 80%, 0.8)",
                    "line-opacity": [
                        "interpolate",
                        ["linear"],
                        ["zoom"],
                        13,
                        0.3,
                        15,
                        0
                    ]
                }
            },
            {
                "id": "tunnel-secondary-tertiary",
                "type": "line",
                "metadata": {
                    "mapbox:featureComponent": "road-network",
                    "mapbox:group": "Road network, tunnels"
                },
                "source": "composite",
                "source-layer": "road",
                "minzoom": 13,
                "filter": [
                    "all",
                    ["==", ["get", "structure"], "tunnel"],
                    [
                        "match",
                        ["get", "class"],
                        ["secondary", "tertiary"],
                        true,
                        false
                    ],
                    ["==", ["geometry-type"], "LineString"]
                ],
                "paint": {
                    "line-width": [
                        "interpolate",
                        ["exponential", 1.5],
                        ["zoom"],
                        3,
                        0,
                        18,
                        26,
                        22,
                        260
                    ],
                    "line-color": "hsla(0, 0%, 80%, 0.8)",
                    "line-opacity": [
                        "interpolate",
                        ["linear"],
                        ["zoom"],
                        13,
                        0.3,
                        15,
                        0
                    ]
                }
            },
            {
                "id": "tunnel-primary",
                "type": "line",
                "metadata": {
                    "mapbox:featureComponent": "road-network",
                    "mapbox:group": "Road network, tunnels"
                },
                "source": "composite",
                "source-layer": "road",
                "minzoom": 13,
                "filter": [
                    "all",
                    ["==", ["get", "structure"], "tunnel"],
                    ["==", ["get", "class"], "primary"],
                    ["==", ["geometry-type"], "LineString"]
                ],
                "paint": {
                    "line-width": [
                        "interpolate",
                        ["exponential", 1.5],
                        ["zoom"],
                        3,
                        0.8,
                        18,
                        28,
                        22,
                        280
                    ],
                    "line-color": "hsla(0, 0%, 80%, 0.8)",
                    "line-opacity": [
                        "interpolate",
                        ["linear"],
                        ["zoom"],
                        13,
                        0.3,
                        15,
                        0
                    ]
                }
            },
            {
                "id": "tunnel-motorway-trunk",
                "type": "line",
                "metadata": {
                    "mapbox:featureComponent": "road-network",
                    "mapbox:group": "Road network, tunnels"
                },
                "source": "composite",
                "source-layer": "road",
                "minzoom": 13,
                "filter": [
                    "all",
                    ["==", ["get", "structure"], "tunnel"],
                    ["match", ["get", "class"], ["motorway", "trunk"], true, false],
                    ["==", ["geometry-type"], "LineString"]
                ],
                "paint": {
                    "line-width": [
                        "interpolate",
                        ["exponential", 1.5],
                        ["zoom"],
                        3,
                        0.8,
                        18,
                        30,
                        22,
                        300
                    ],
                    "line-color": "rgba(255, 255, 255, 0.8)",
                    "line-opacity": [
                        "interpolate",
                        ["linear"],
                        ["zoom"],
                        13,
                        1,
                        15,
                        0
                    ]
                }
            },
            {
                "id": "road-path",
                "type": "line",
                "metadata": {
                    "mapbox:featureComponent": "walking-cycling",
                    "mapbox:group": "Walking, cycling, etc., surface"
                },
                "source": "composite",
                "source-layer": "road",
                "minzoom": 12,
                "filter": [
                    "all",
                    ["==", ["get", "class"], "path"],
                    [
                        "step",
                        ["zoom"],
                        [
                            "!",
                            [
                                "match",
                                ["get", "type"],
                                ["steps", "sidewalk", "crossing"],
                                true,
                                false
                            ]
                        ],
                        16,
                        ["!=", ["get", "type"], "steps"]
                    ],
                    ["match", ["get", "structure"], ["none", "ford"], true, false],
                    ["==", ["geometry-type"], "LineString"]
                ],
                "layout": {"line-join": ["step", ["zoom"], "miter", 14, "round"]},
                "paint": {
                    "line-width": [
                        "interpolate",
                        ["exponential", 1.5],
                        ["zoom"],
                        13,
                        0.5,
                        14,
                        1,
                        15,
                        1,
                        18,
                        4
                    ],
                    "line-color": "hsla(40, 95%, 90%, 0.8)",
                    "line-opacity": [
                        "interpolate",
                        ["linear"],
                        ["zoom"],
                        17,
                        1,
                        18,
                        0
                    ],
                    "line-dasharray": [
                        "step",
                        ["zoom"],
                        ["literal", [4, 0.3]],
                        15,
                        ["literal", [1.75, 0.3]],
                        16,
                        ["literal", [1, 0.3]],
                        17,
                        ["literal", [1, 0.25]]
                    ]
                }
            },
            {
                "id": "road-steps",
                "type": "line",
                "metadata": {
                    "mapbox:featureComponent": "walking-cycling",
                    "mapbox:group": "Walking, cycling, etc., surface"
                },
                "source": "composite",
                "source-layer": "road",
                "minzoom": 14,
                "filter": [
                    "all",
                    ["==", ["get", "type"], "steps"],
                    ["match", ["get", "structure"], ["none", "ford"], true, false],
                    ["==", ["geometry-type"], "LineString"]
                ],
                "layout": {"line-join": "round"},
                "paint": {
                    "line-width": [
                        "interpolate",
                        ["exponential", 1.5],
                        ["zoom"],
                        15,
                        1,
                        16,
                        1.6,
                        18,
                        6
                    ],
                    "line-color": "hsla(40, 95%, 90%, 0.8)",
                    "line-opacity": [
                        "interpolate",
                        ["linear"],
                        ["zoom"],
                        17,
                        1,
                        18,
                        0
                    ],
                    "line-dasharray": [
                        "step",
                        ["zoom"],
                        ["literal", [1, 0]],
                        15,
                        ["literal", [1.75, 1]],
                        16,
                        ["literal", [1, 0.75]],
                        17,
                        ["literal", [0.3, 0.3]]
                    ]
                }
            },
            {
                "id": "road-pedestrian",
                "type": "line",
                "metadata": {
                    "mapbox:featureComponent": "walking-cycling",
                    "mapbox:group": "Walking, cycling, etc., surface"
                },
                "source": "composite",
                "source-layer": "road",
                "minzoom": 12,
                "filter": [
                    "all",
                    ["==", ["get", "class"], "pedestrian"],
                    ["match", ["get", "structure"], ["none", "ford"], true, false],
                    ["case", ["has", "layer"], [">=", ["get", "layer"], 0], true],
                    ["==", ["geometry-type"], "LineString"]
                ],
                "layout": {"line-join": ["step", ["zoom"], "miter", 14, "round"]},
                "paint": {
                    "line-width": [
                        "interpolate",
                        ["exponential", 1.5],
                        ["zoom"],
                        14,
                        0.5,
                        18,
                        12
                    ],
                    "line-color": "hsla(40, 95%, 90%, 0.8)",
                    "line-opacity": [
                        "interpolate",
                        ["linear"],
                        ["zoom"],
                        17,
                        1,
                        18,
                        0
                    ],
                    "line-dasharray": [
                        "step",
                        ["zoom"],
                        ["literal", [2, 0.3]],
                        15,
                        ["literal", [1, 0.3]],
                        16,
                        ["literal", [1, 0.3]],
                        17,
                        ["literal", [1, 0.25]]
                    ]
                }
            },
            {
                "id": "road-minor-case",
                "type": "line",
                "metadata": {
                    "mapbox:featureComponent": "road-network",
                    "mapbox:group": "Road network, surface"
                },
                "source": "composite",
                "source-layer": "road",
                "minzoom": 13,
                "filter": [
                    "all",
                    [
                        "match",
                        ["get", "class"],
                        ["track"],
                        true,
                        "service",
                        ["step", ["zoom"], false, 14, true],
                        false
                    ],
                    ["match", ["get", "structure"], ["none", "ford"], true, false],
                    ["==", ["geometry-type"], "LineString"]
                ],
                "layout": {
                    "line-cap": ["step", ["zoom"], "butt", 14, "round"],
                    "line-join": ["step", ["zoom"], "miter", 14, "round"]
                },
                "paint": {
                    "line-width": [
                        "interpolate",
                        ["exponential", 1.5],
                        ["zoom"],
                        14,
                        0.8,
                        22,
                        2
                    ],
                    "line-color": [
                        "match",
                        ["get", "class"],
                        "track",
                        "hsla(40, 95%, 90%, 0.8)",
                        "hsla(0, 1%, 10%, 0.7)"
                    ],
                    "line-gap-width": [
                        "interpolate",
                        ["exponential", 1.5],
                        ["zoom"],
                        14,
                        1,
                        18,
                        10,
                        22,
                        100
                    ],
                    "line-opacity": [
                        "interpolate",
                        ["linear"],
                        ["zoom"],
                        13,
                        1,
                        15,
                        0
                    ]
                }
            },
            {
                "id": "road-street-case",
                "type": "line",
                "metadata": {
                    "mapbox:featureComponent": "road-network",
                    "mapbox:group": "Road network, surface"
                },
                "source": "composite",
                "source-layer": "road",
                "minzoom": 14,
                "filter": [
                    "all",
                    [
                        "match",
                        ["get", "class"],
                        ["street", "street_limited"],
                        true,
                        false
                    ],
                    ["match", ["get", "structure"], ["none", "ford"], true, false],
                    ["==", ["geometry-type"], "LineString"]
                ],
                "layout": {
                    "line-cap": ["step", ["zoom"], "butt", 14, "round"],
                    "line-join": ["step", ["zoom"], "miter", 14, "round"]
                },
                "paint": {
                    "line-width": [
                        "interpolate",
                        ["exponential", 1.5],
                        ["zoom"],
                        14,
                        0.8,
                        22,
                        2
                    ],
                    "line-color": "hsla(0, 1%, 10%, 0.7)",
                    "line-gap-width": [
                        "interpolate",
                        ["exponential", 1.5],
                        ["zoom"],
                        12,
                        0.5,
                        18,
                        20,
                        22,
                        200
                    ],
                    "line-opacity": [
                        "interpolate",
                        ["linear"],
                        ["zoom"],
                        13,
                        0.3,
                        15,
                        0
                    ]
                }
            },
            {
                "id": "road-minor-link-case",
                "type": "line",
                "metadata": {
                    "mapbox:featureComponent": "road-network",
                    "mapbox:group": "Road network, surface"
                },
                "source": "composite",
                "source-layer": "road",
                "minzoom": 13,
                "filter": [
                    "all",
                    [
                        "match",
                        ["get", "class"],
                        ["primary_link", "secondary_link", "tertiary_link"],
                        true,
                        false
                    ],
                    ["match", ["get", "structure"], ["none", "ford"], true, false],
                    ["==", ["geometry-type"], "LineString"]
                ],
                "layout": {
                    "line-cap": ["step", ["zoom"], "butt", 14, "round"],
                    "line-join": ["step", ["zoom"], "miter", 14, "round"]
                },
                "paint": {
                    "line-width": [
                        "interpolate",
                        ["exponential", 1.5],
                        ["zoom"],
                        14,
                        0.8,
                        22,
                        2
                    ],
                    "line-color": "hsla(0, 1%, 10%, 0.7)",
                    "line-gap-width": [
                        "interpolate",
                        ["exponential", 1.5],
                        ["zoom"],
                        12,
                        0.4,
                        18,
                        18,
                        22,
                        180
                    ],
                    "line-opacity": [
                        "interpolate",
                        ["linear"],
                        ["zoom"],
                        13,
                        1,
                        15,
                        0
                    ]
                }
            },
            {
                "id": "road-secondary-tertiary-case",
                "type": "line",
                "metadata": {
                    "mapbox:featureComponent": "road-network",
                    "mapbox:group": "Road network, surface"
                },
                "source": "composite",
                "source-layer": "road",
                "minzoom": 11,
                "filter": [
                    "all",
                    [
                        "match",
                        ["get", "class"],
                        ["secondary", "tertiary"],
                        true,
                        false
                    ],
                    ["match", ["get", "structure"], ["none", "ford"], true, false],
                    ["==", ["geometry-type"], "LineString"]
                ],
                "layout": {
                    "line-cap": ["step", ["zoom"], "butt", 14, "round"],
                    "line-join": ["step", ["zoom"], "miter", 14, "round"]
                },
                "paint": {
                    "line-width": [
                        "interpolate",
                        ["exponential", 1.5],
                        ["zoom"],
                        14,
                        0.8,
                        22,
                        2
                    ],
                    "line-color": "hsla(0, 1%, 10%, 0.7)",
                    "line-gap-width": [
                        "interpolate",
                        ["exponential", 1.5],
                        ["zoom"],
                        3,
                        0,
                        18,
                        26,
                        22,
                        260
                    ],
                    "line-opacity": [
                        "interpolate",
                        ["linear"],
                        ["zoom"],
                        13,
                        0.3,
                        15,
                        0
                    ]
                }
            },
            {
                "id": "road-primary-case",
                "type": "line",
                "metadata": {
                    "mapbox:featureComponent": "road-network",
                    "mapbox:group": "Road network, surface"
                },
                "source": "composite",
                "source-layer": "road",
                "minzoom": 10,
                "filter": [
                    "all",
                    ["==", ["get", "class"], "primary"],
                    ["match", ["get", "structure"], ["none", "ford"], true, false],
                    ["==", ["geometry-type"], "LineString"]
                ],
                "layout": {
                    "line-cap": ["step", ["zoom"], "butt", 14, "round"],
                    "line-join": ["step", ["zoom"], "miter", 14, "round"]
                },
                "paint": {
                    "line-width": [
                        "interpolate",
                        ["exponential", 1.5],
                        ["zoom"],
                        14,
                        1,
                        22,
                        2
                    ],
                    "line-color": "hsla(0, 1%, 10%, 0.7)",
                    "line-gap-width": [
                        "interpolate",
                        ["exponential", 1.5],
                        ["zoom"],
                        3,
                        0.8,
                        18,
                        28,
                        22,
                        280
                    ],
                    "line-opacity": [
                        "interpolate",
                        ["linear"],
                        ["zoom"],
                        13,
                        1,
                        15,
                        0
                    ]
                }
            },
            {
                "id": "road-major-link-case",
                "type": "line",
                "metadata": {
                    "mapbox:featureComponent": "road-network",
                    "mapbox:group": "Road network, surface"
                },
                "source": "composite",
                "source-layer": "road",
                "minzoom": 12,
                "filter": [
                    "all",
                    [
                        "match",
                        ["get", "class"],
                        ["motorway_link", "trunk_link"],
                        true,
                        false
                    ],
                    ["match", ["get", "structure"], ["none", "ford"], true, false],
                    ["==", ["geometry-type"], "LineString"]
                ],
                "layout": {
                    "line-cap": ["step", ["zoom"], "butt", 14, "round"],
                    "line-join": ["step", ["zoom"], "miter", 14, "round"]
                },
                "paint": {
                    "line-width": [
                        "interpolate",
                        ["exponential", 1.5],
                        ["zoom"],
                        14,
                        0.8,
                        22,
                        2
                    ],
                    "line-color": "hsla(0, 1%, 22%, 0.7)",
                    "line-gap-width": [
                        "interpolate",
                        ["exponential", 1.5],
                        ["zoom"],
                        12,
                        0.8,
                        18,
                        20,
                        22,
                        200
                    ],
                    "line-opacity": [
                        "interpolate",
                        ["linear"],
                        ["zoom"],
                        13,
                        1,
                        15,
                        0
                    ]
                }
            },
            {
                "id": "road-motorway-trunk-case",
                "type": "line",
                "metadata": {
                    "mapbox:featureComponent": "road-network",
                    "mapbox:group": "Road network, surface"
                },
                "source": "composite",
                "source-layer": "road",
                "minzoom": 3,
                "filter": [
                    "all",
                    [
                        "step",
                        ["zoom"],
                        [
                            "match",
                            ["get", "class"],
                            ["motorway", "trunk"],
                            true,
                            false
                        ],
                        5,
                        [
                            "all",
                            [
                                "match",
                                ["get", "class"],
                                ["motorway", "trunk"],
                                true,
                                false
                            ],
                            [
                                "match",
                                ["get", "structure"],
                                ["none", "ford"],
                                true,
                                false
                            ]
                        ]
                    ],
                    ["==", ["geometry-type"], "LineString"]
                ],
                "layout": {
                    "line-cap": ["step", ["zoom"], "butt", 14, "round"],
                    "line-join": ["step", ["zoom"], "miter", 14, "round"]
                },
                "paint": {
                    "line-width": [
                        "interpolate",
                        ["exponential", 1.5],
                        ["zoom"],
                        14,
                        1,
                        22,
                        2
                    ],
                    "line-color": "hsla(0, 1%, 22%, 0.7)",
                    "line-gap-width": [
                        "interpolate",
                        ["exponential", 1.5],
                        ["zoom"],
                        3,
                        0.8,
                        18,
                        30,
                        22,
                        300
                    ],
                    "line-opacity": [
                        "interpolate",
                        ["linear"],
                        ["zoom"],
                        3,
                        0,
                        3.5,
                        1,
                        13,
                        1,
                        15,
                        0
                    ]
                }
            },
            {
                "id": "road-minor",
                "type": "line",
                "metadata": {
                    "mapbox:featureComponent": "road-network",
                    "mapbox:group": "Road network, surface"
                },
                "source": "composite",
                "source-layer": "road",
                "minzoom": 13,
                "filter": [
                    "all",
                    [
                        "match",
                        ["get", "class"],
                        ["track"],
                        true,
                        "service",
                        ["step", ["zoom"], false, 14, true],
                        false
                    ],
                    ["match", ["get", "structure"], ["none", "ford"], true, false],
                    ["==", ["geometry-type"], "LineString"]
                ],
                "layout": {
                    "line-cap": ["step", ["zoom"], "butt", 14, "round"],
                    "line-join": ["step", ["zoom"], "miter", 14, "round"]
                },
                "paint": {
                    "line-width": [
                        "interpolate",
                        ["exponential", 1.5],
                        ["zoom"],
                        14,
                        1,
                        18,
                        10,
                        22,
                        100
                    ],
                    "line-color": "hsla(0, 0%, 80%, 0.8)",
                    "line-opacity": [
                        "interpolate",
                        ["linear"],
                        ["zoom"],
                        13,
                        1,
                        15,
                        0
                    ]
                }
            },
            {
                "id": "road-minor-link",
                "type": "line",
                "metadata": {
                    "mapbox:featureComponent": "road-network",
                    "mapbox:group": "Road network, surface"
                },
                "source": "composite",
                "source-layer": "road",
                "minzoom": 12,
                "filter": [
                    "all",
                    [
                        "match",
                        ["get", "class"],
                        ["primary_link", "secondary_link", "tertiary_link"],
                        true,
                        false
                    ],
                    ["match", ["get", "structure"], ["none", "ford"], true, false],
                    ["==", ["geometry-type"], "LineString"]
                ],
                "layout": {
                    "line-cap": ["step", ["zoom"], "butt", 13, "round"],
                    "line-join": ["step", ["zoom"], "miter", 13, "round"]
                },
                "paint": {
                    "line-width": [
                        "interpolate",
                        ["exponential", 1.5],
                        ["zoom"],
                        12,
                        0.4,
                        18,
                        18,
                        22,
                        180
                    ],
                    "line-color": "hsla(0, 0%, 80%, 0.8)",
                    "line-opacity": [
                        "interpolate",
                        ["linear"],
                        ["zoom"],
                        13,
                        1,
                        15,
                        0
                    ]
                }
            },
            {
                "id": "road-major-link",
                "type": "line",
                "metadata": {
                    "mapbox:featureComponent": "road-network",
                    "mapbox:group": "Road network, surface"
                },
                "source": "composite",
                "source-layer": "road",
                "minzoom": 12,
                "filter": [
                    "all",
                    [
                        "match",
                        ["get", "class"],
                        ["motorway_link", "trunk_link"],
                        true,
                        false
                    ],
                    ["match", ["get", "structure"], ["none", "ford"], true, false],
                    ["==", ["geometry-type"], "LineString"]
                ],
                "layout": {
                    "line-cap": ["step", ["zoom"], "butt", 13, "round"],
                    "line-join": ["step", ["zoom"], "miter", 13, "round"]
                },
                "paint": {
                    "line-width": [
                        "interpolate",
                        ["exponential", 1.5],
                        ["zoom"],
                        12,
                        0.8,
                        18,
                        20,
                        22,
                        200
                    ],
                    "line-color": [
                        "match",
                        ["get", "class"],
                        "motorway_link",
                        "rgba(229, 243, 255, 0.8)",
                        "rgba(230, 235, 254, 0.8)"
                    ],
                    "line-opacity": [
                        "interpolate",
                        ["linear"],
                        ["zoom"],
                        13,
                        1,
                        15,
                        0
                    ]
                }
            },
            {
                "id": "road-street",
                "type": "line",
                "metadata": {
                    "mapbox:featureComponent": "road-network",
                    "mapbox:group": "Road network, surface"
                },
                "source": "composite",
                "source-layer": "road",
                "minzoom": 13,
                "filter": [
                    "all",
                    [
                        "match",
                        ["get", "class"],
                        ["street", "street_limited"],
                        true,
                        false
                    ],
                    ["match", ["get", "structure"], ["none", "ford"], true, false],
                    ["==", ["geometry-type"], "LineString"]
                ],
                "layout": {
                    "line-cap": ["step", ["zoom"], "butt", 14, "round"],
                    "line-join": ["step", ["zoom"], "miter", 14, "round"]
                },
                "paint": {
                    "line-width": [
                        "interpolate",
                        ["exponential", 1.5],
                        ["zoom"],
                        12,
                        0.5,
                        18,
                        20,
                        22,
                        200
                    ],
                    "line-color": [
                        "match",
                        ["get", "class"],
                        "street_limited",
                        "hsl(0, 2%, 22%)",
                        "hsla(0, 0%, 80%, 0.8)"
                    ],
                    "line-opacity": [
                        "interpolate",
                        ["linear"],
                        ["zoom"],
                        13,
                        0.3,
                        15,
                        0
                    ]
                }
            },
            {
                "id": "road-street-low",
                "type": "line",
                "metadata": {
                    "mapbox:featureComponent": "road-network",
                    "mapbox:group": "Road network, surface"
                },
                "source": "composite",
                "source-layer": "road",
                "minzoom": 11,
                "maxzoom": 14,
                "filter": [
                    "all",
                    [
                        "match",
                        ["get", "class"],
                        ["street", "street_limited"],
                        true,
                        false
                    ],
                    ["match", ["get", "structure"], ["none", "ford"], true, false],
                    ["==", ["geometry-type"], "LineString"]
                ],
                "layout": {
                    "line-cap": ["step", ["zoom"], "butt", 14, "round"],
                    "line-join": ["step", ["zoom"], "miter", 14, "round"]
                },
                "paint": {
                    "line-width": [
                        "interpolate",
                        ["exponential", 1.5],
                        ["zoom"],
                        12,
                        0.5,
                        18,
                        20,
                        22,
                        200
                    ],
                    "line-color": "hsla(0, 0%, 80%, 0.8)",
                    "line-opacity": [
                        "interpolate",
                        ["linear"],
                        ["zoom"],
                        13,
                        0.3,
                        15,
                        0
                    ]
                }
            },
            {
                "id": "road-secondary-tertiary",
                "type": "line",
                "metadata": {
                    "mapbox:featureComponent": "road-network",
                    "mapbox:group": "Road network, surface"
                },
                "source": "composite",
                "source-layer": "road",
                "minzoom": 9,
                "filter": [
                    "all",
                    [
                        "match",
                        ["get", "class"],
                        ["secondary", "tertiary"],
                        true,
                        false
                    ],
                    ["match", ["get", "structure"], ["none", "ford"], true, false],
                    ["==", ["geometry-type"], "LineString"]
                ],
                "layout": {
                    "line-cap": ["step", ["zoom"], "butt", 14, "round"],
                    "line-join": ["step", ["zoom"], "miter", 14, "round"]
                },
                "paint": {
                    "line-width": [
                        "interpolate",
                        ["exponential", 1.5],
                        ["zoom"],
                        3,
                        0,
                        18,
                        26,
                        22,
                        260
                    ],
                    "line-color": "hsla(0, 0%, 80%, 0.8)",
                    "line-opacity": [
                        "interpolate",
                        ["linear"],
                        ["zoom"],
                        13,
                        0.3,
                        15,
                        0
                    ]
                }
            },
            {
                "id": "road-primary",
                "type": "line",
                "metadata": {
                    "mapbox:featureComponent": "road-network",
                    "mapbox:group": "Road network, surface"
                },
                "source": "composite",
                "source-layer": "road",
                "minzoom": 6,
                "filter": [
                    "all",
                    ["==", ["get", "class"], "primary"],
                    ["match", ["get", "structure"], ["none", "ford"], true, false],
                    ["==", ["geometry-type"], "LineString"]
                ],
                "layout": {
                    "line-cap": ["step", ["zoom"], "butt", 14, "round"],
                    "line-join": ["step", ["zoom"], "miter", 14, "round"]
                },
                "paint": {
                    "line-width": [
                        "interpolate",
                        ["exponential", 1.5],
                        ["zoom"],
                        3,
                        0.8,
                        18,
                        28,
                        22,
                        280
                    ],
                    "line-color": "hsla(0, 0%, 80%, 0.8)",
                    "line-opacity": [
                        "interpolate",
                        ["linear"],
                        ["zoom"],
                        13,
                        1,
                        15,
                        0
                    ]
                }
            },
            {
                "id": "road-motorway-trunk",
                "type": "line",
                "metadata": {
                    "mapbox:featureComponent": "road-network",
                    "mapbox:group": "Road network, surface"
                },
                "source": "composite",
                "source-layer": "road",
                "minzoom": 3,
                "filter": [
                    "all",
                    [
                        "step",
                        ["zoom"],
                        [
                            "match",
                            ["get", "class"],
                            ["motorway", "trunk"],
                            true,
                            false
                        ],
                        5,
                        [
                            "all",
                            [
                                "match",
                                ["get", "class"],
                                ["motorway", "trunk"],
                                true,
                                false
                            ],
                            [
                                "match",
                                ["get", "structure"],
                                ["none", "ford"],
                                true,
                                false
                            ]
                        ]
                    ],
                    ["==", ["geometry-type"], "LineString"]
                ],
                "layout": {
                    "line-cap": ["step", ["zoom"], "butt", 13, "round"],
                    "line-join": ["step", ["zoom"], "miter", 13, "round"]
                },
                "paint": {
                    "line-width": [
                        "interpolate",
                        ["exponential", 1.5],
                        ["zoom"],
                        3,
                        0.8,
                        18,
                        30,
                        22,
                        300
                    ],
                    "line-color": [
                        "step",
                        ["zoom"],
                        [
                            "match",
                            ["get", "class"],
                            "motorway",
                            "rgba(201, 229, 253, 0.8)",
                            "trunk",
                            "rgba(156, 176, 247, 0.8)",
                            "hsl(0, 0%, 22%)"
                        ],
                        9,
                        [
                            "match",
                            ["get", "class"],
                            "motorway",
                            "rgba(229, 243, 255, 0.8)",
                            "rgba(230, 235, 254, 0.8)"
                        ]
                    ],
                    "line-opacity": [
                        "interpolate",
                        ["linear"],
                        ["zoom"],
                        3,
                        0,
                        3.5,
                        1,
                        13,
                        1,
                        15,
                        0
                    ]
                }
            },
            {
                "id": "bridge-path",
                "type": "line",
                "metadata": {
                    "mapbox:featureComponent": "walking-cycling",
                    "mapbox:group": "Walking, cycling, etc., barriers-bridges"
                },
                "source": "composite",
                "source-layer": "road",
                "minzoom": 14,
                "filter": [
                    "all",
                    ["==", ["get", "structure"], "bridge"],
                    ["==", ["get", "class"], "path"],
                    ["!=", ["get", "type"], "steps"],
                    ["==", ["geometry-type"], "LineString"]
                ],
                "layout": {},
                "paint": {
                    "line-width": [
                        "interpolate",
                        ["exponential", 1.5],
                        ["zoom"],
                        15,
                        1,
                        18,
                        4
                    ],
                    "line-color": "hsla(40, 95%, 90%, 0.8)",
                    "line-opacity": [
                        "interpolate",
                        ["linear"],
                        ["zoom"],
                        17,
                        1,
                        18,
                        0
                    ],
                    "line-dasharray": [
                        "step",
                        ["zoom"],
                        ["literal", [4, 0.3]],
                        15,
                        ["literal", [1.75, 0.3]],
                        16,
                        ["literal", [1, 0.3]],
                        17,
                        ["literal", [1, 0.25]]
                    ]
                }
            },
            {
                "id": "bridge-steps",
                "type": "line",
                "metadata": {
                    "mapbox:featureComponent": "walking-cycling",
                    "mapbox:group": "Walking, cycling, etc., barriers-bridges"
                },
                "source": "composite",
                "source-layer": "road",
                "minzoom": 14,
                "filter": [
                    "all",
                    ["==", ["get", "type"], "steps"],
                    ["==", ["get", "structure"], "bridge"],
                    ["==", ["geometry-type"], "LineString"]
                ],
                "paint": {
                    "line-width": [
                        "interpolate",
                        ["exponential", 1.5],
                        ["zoom"],
                        15,
                        1,
                        16,
                        1.6,
                        18,
                        6
                    ],
                    "line-color": "hsla(40, 95%, 90%, 0.8)",
                    "line-opacity": [
                        "interpolate",
                        ["linear"],
                        ["zoom"],
                        17,
                        1,
                        18,
                        0
                    ],
                    "line-dasharray": [
                        "step",
                        ["zoom"],
                        ["literal", [1, 0]],
                        15,
                        ["literal", [1.75, 1]],
                        16,
                        ["literal", [1, 0.75]],
                        17,
                        ["literal", [0.3, 0.3]]
                    ]
                }
            },
            {
                "id": "bridge-pedestrian",
                "type": "line",
                "metadata": {
                    "mapbox:featureComponent": "walking-cycling",
                    "mapbox:group": "Walking, cycling, etc., barriers-bridges"
                },
                "source": "composite",
                "source-layer": "road",
                "minzoom": 13,
                "filter": [
                    "all",
                    ["==", ["get", "structure"], "bridge"],
                    ["==", ["get", "class"], "pedestrian"],
                    ["==", ["geometry-type"], "LineString"]
                ],
                "paint": {
                    "line-width": [
                        "interpolate",
                        ["exponential", 1.5],
                        ["zoom"],
                        14,
                        0.5,
                        18,
                        12
                    ],
                    "line-color": "hsla(40, 95%, 90%, 0.8)",
                    "line-opacity": [
                        "interpolate",
                        ["linear"],
                        ["zoom"],
                        17,
                        1,
                        18,
                        0
                    ],
                    "line-dasharray": [
                        "step",
                        ["zoom"],
                        ["literal", [2, 0.3]],
                        15,
                        ["literal", [1, 0.3]],
                        16,
                        ["literal", [1, 0.3]],
                        17,
                        ["literal", [1, 0.25]]
                    ]
                }
            },
            {
                "id": "bridge-minor-case",
                "type": "line",
                "metadata": {
                    "mapbox:featureComponent": "road-network",
                    "mapbox:group": "Road network, bridges"
                },
                "source": "composite",
                "source-layer": "road",
                "minzoom": 13,
                "filter": [
                    "all",
                    ["==", ["get", "structure"], "bridge"],
                    [
                        "match",
                        ["get", "class"],
                        ["track"],
                        true,
                        "service",
                        ["step", ["zoom"], false, 14, true],
                        false
                    ],
                    ["==", ["geometry-type"], "LineString"]
                ],
                "paint": {
                    "line-width": [
                        "interpolate",
                        ["exponential", 1.5],
                        ["zoom"],
                        14,
                        0.8,
                        22,
                        2
                    ],
                    "line-color": [
                        "match",
                        ["get", "class"],
                        "track",
                        "hsla(40, 95%, 90%, 0.8)",
                        "hsla(0, 1%, 10%, 0.7)"
                    ],
                    "line-gap-width": [
                        "interpolate",
                        ["exponential", 1.5],
                        ["zoom"],
                        14,
                        1,
                        18,
                        10,
                        22,
                        100
                    ],
                    "line-opacity": [
                        "interpolate",
                        ["linear"],
                        ["zoom"],
                        13,
                        1,
                        15,
                        0
                    ]
                }
            },
            {
                "id": "bridge-street-case",
                "type": "line",
                "metadata": {
                    "mapbox:featureComponent": "road-network",
                    "mapbox:group": "Road network, bridges"
                },
                "source": "composite",
                "source-layer": "road",
                "minzoom": 14,
                "filter": [
                    "all",
                    ["==", ["get", "structure"], "bridge"],
                    [
                        "match",
                        ["get", "class"],
                        ["street", "street_limited"],
                        true,
                        false
                    ],
                    ["==", ["geometry-type"], "LineString"]
                ],
                "paint": {
                    "line-width": [
                        "interpolate",
                        ["exponential", 1.5],
                        ["zoom"],
                        14,
                        0.8,
                        22,
                        2
                    ],
                    "line-color": [
                        "match",
                        ["get", "class"],
                        "track",
                        "hsla(40, 95%, 90%, 0.8)",
                        "hsla(0, 1%, 10%, 0.7)"
                    ],
                    "line-gap-width": [
                        "interpolate",
                        ["exponential", 1.5],
                        ["zoom"],
                        12,
                        0.5,
                        18,
                        20,
                        22,
                        200
                    ],
                    "line-opacity": [
                        "interpolate",
                        ["linear"],
                        ["zoom"],
                        13,
                        1,
                        15,
                        0
                    ]
                }
            },
            {
                "id": "bridge-minor-link-case",
                "type": "line",
                "metadata": {
                    "mapbox:featureComponent": "road-network",
                    "mapbox:group": "Road network, bridges"
                },
                "source": "composite",
                "source-layer": "road",
                "minzoom": 13,
                "filter": [
                    "all",
                    [
                        "match",
                        ["get", "class"],
                        ["primary_link", "secondary_link", "tertiary_link"],
                        true,
                        false
                    ],
                    ["==", ["get", "structure"], "bridge"],
                    ["==", ["geometry-type"], "LineString"]
                ],
                "layout": {"line-join": ["step", ["zoom"], "miter", 14, "round"]},
                "paint": {
                    "line-width": [
                        "interpolate",
                        ["exponential", 1.5],
                        ["zoom"],
                        14,
                        0.8,
                        22,
                        2
                    ],
                    "line-color": "hsla(0, 1%, 10%, 0.7)",
                    "line-gap-width": [
                        "interpolate",
                        ["exponential", 1.5],
                        ["zoom"],
                        12,
                        0.4,
                        18,
                        18,
                        22,
                        180
                    ],
                    "line-opacity": [
                        "interpolate",
                        ["linear"],
                        ["zoom"],
                        13,
                        1,
                        15,
                        0
                    ]
                }
            },
            {
                "id": "bridge-secondary-tertiary-case",
                "type": "line",
                "metadata": {
                    "mapbox:featureComponent": "road-network",
                    "mapbox:group": "Road network, bridges"
                },
                "source": "composite",
                "source-layer": "road",
                "minzoom": 11,
                "filter": [
                    "all",
                    ["==", ["get", "structure"], "bridge"],
                    [
                        "match",
                        ["get", "class"],
                        ["secondary", "tertiary"],
                        true,
                        false
                    ],
                    ["==", ["geometry-type"], "LineString"]
                ],
                "paint": {
                    "line-width": [
                        "interpolate",
                        ["exponential", 1.5],
                        ["zoom"],
                        14,
                        1,
                        22,
                        2
                    ],
                    "line-color": "hsla(0, 1%, 10%, 0.7)",
                    "line-gap-width": [
                        "interpolate",
                        ["exponential", 1.5],
                        ["zoom"],
                        3,
                        0,
                        18,
                        26,
                        22,
                        260
                    ],
                    "line-opacity": [
                        "interpolate",
                        ["linear"],
                        ["zoom"],
                        13,
                        0.3,
                        15,
                        0
                    ]
                }
            },
            {
                "id": "bridge-primary-case",
                "type": "line",
                "metadata": {
                    "mapbox:featureComponent": "road-network",
                    "mapbox:group": "Road network, bridges"
                },
                "source": "composite",
                "source-layer": "road",
                "minzoom": 10,
                "filter": [
                    "all",
                    ["==", ["get", "structure"], "bridge"],
                    ["==", ["get", "class"], "primary"],
                    ["==", ["geometry-type"], "LineString"]
                ],
                "paint": {
                    "line-width": [
                        "interpolate",
                        ["exponential", 1.5],
                        ["zoom"],
                        14,
                        1,
                        22,
                        2
                    ],
                    "line-color": "hsla(0, 1%, 10%, 0.7)",
                    "line-gap-width": [
                        "interpolate",
                        ["exponential", 1.5],
                        ["zoom"],
                        3,
                        0.8,
                        18,
                        28,
                        22,
                        280
                    ],
                    "line-opacity": [
                        "interpolate",
                        ["linear"],
                        ["zoom"],
                        13,
                        0.3,
                        15,
                        0
                    ]
                }
            },
            {
                "id": "bridge-major-link-case",
                "type": "line",
                "metadata": {
                    "mapbox:featureComponent": "road-network",
                    "mapbox:group": "Road network, bridges"
                },
                "source": "composite",
                "source-layer": "road",
                "minzoom": 12,
                "filter": [
                    "all",
                    ["==", ["get", "structure"], "bridge"],
                    [
                        "match",
                        ["get", "class"],
                        ["motorway_link", "trunk_link"],
                        true,
                        false
                    ],
                    ["<=", ["get", "layer"], 1],
                    ["==", ["geometry-type"], "LineString"]
                ],
                "paint": {
                    "line-width": [
                        "interpolate",
                        ["exponential", 1.5],
                        ["zoom"],
                        14,
                        0.8,
                        22,
                        2
                    ],
                    "line-color": "hsla(0, 1%, 22%, 0.7)",
                    "line-gap-width": [
                        "interpolate",
                        ["exponential", 1.5],
                        ["zoom"],
                        12,
                        0.8,
                        18,
                        20,
                        22,
                        200
                    ],
                    "line-opacity": [
                        "interpolate",
                        ["linear"],
                        ["zoom"],
                        13,
                        1,
                        15,
                        0
                    ]
                }
            },
            {
                "id": "bridge-motorway-trunk-case",
                "type": "line",
                "metadata": {
                    "mapbox:featureComponent": "road-network",
                    "mapbox:group": "Road network, bridges"
                },
                "source": "composite",
                "source-layer": "road",
                "minzoom": 13,
                "filter": [
                    "all",
                    ["==", ["get", "structure"], "bridge"],
                    ["match", ["get", "class"], ["motorway", "trunk"], true, false],
                    ["<=", ["get", "layer"], 1],
                    ["==", ["geometry-type"], "LineString"]
                ],
                "paint": {
                    "line-width": [
                        "interpolate",
                        ["exponential", 1.5],
                        ["zoom"],
                        14,
                        1,
                        22,
                        2
                    ],
                    "line-color": "hsla(0, 1%, 22%, 0.7)",
                    "line-gap-width": [
                        "interpolate",
                        ["exponential", 1.5],
                        ["zoom"],
                        3,
                        0.8,
                        18,
                        30,
                        22,
                        300
                    ],
                    "line-opacity": [
                        "interpolate",
                        ["linear"],
                        ["zoom"],
                        13,
                        1,
                        15,
                        0
                    ]
                }
            },
            {
                "id": "bridge-minor",
                "type": "line",
                "metadata": {
                    "mapbox:featureComponent": "road-network",
                    "mapbox:group": "Road network, bridges"
                },
                "source": "composite",
                "source-layer": "road",
                "minzoom": 13,
                "filter": [
                    "all",
                    ["==", ["get", "structure"], "bridge"],
                    [
                        "match",
                        ["get", "class"],
                        ["track"],
                        true,
                        "service",
                        ["step", ["zoom"], false, 14, true],
                        false
                    ],
                    ["==", ["geometry-type"], "LineString"]
                ],
                "layout": {"line-cap": ["step", ["zoom"], "butt", 14, "round"]},
                "paint": {
                    "line-width": [
                        "interpolate",
                        ["exponential", 1.5],
                        ["zoom"],
                        14,
                        1,
                        18,
                        10,
                        22,
                        100
                    ],
                    "line-color": "hsla(0, 0%, 80%, 0.8)",
                    "line-opacity": [
                        "interpolate",
                        ["linear"],
                        ["zoom"],
                        13,
                        1,
                        15,
                        0
                    ]
                }
            },
            {
                "id": "bridge-minor-link",
                "type": "line",
                "metadata": {
                    "mapbox:featureComponent": "road-network",
                    "mapbox:group": "Road network, bridges"
                },
                "source": "composite",
                "source-layer": "road",
                "minzoom": 13,
                "filter": [
                    "all",
                    [
                        "match",
                        ["get", "class"],
                        ["primary_link", "secondary_link", "tertiary_link"],
                        true,
                        false
                    ],
                    ["==", ["get", "structure"], "bridge"],
                    ["==", ["geometry-type"], "LineString"]
                ],
                "layout": {"line-cap": ["step", ["zoom"], "butt", 14, "round"]},
                "paint": {
                    "line-width": [
                        "interpolate",
                        ["exponential", 1.5],
                        ["zoom"],
                        12,
                        0.4,
                        18,
                        18,
                        22,
                        180
                    ],
                    "line-color": "hsla(0, 0%, 80%, 0.8)",
                    "line-opacity": [
                        "interpolate",
                        ["linear"],
                        ["zoom"],
                        13,
                        1,
                        15,
                        0
                    ]
                }
            },
            {
                "id": "bridge-major-link",
                "type": "line",
                "metadata": {
                    "mapbox:featureComponent": "road-network",
                    "mapbox:group": "Road network, bridges"
                },
                "source": "composite",
                "source-layer": "road",
                "minzoom": 12,
                "filter": [
                    "all",
                    ["==", ["get", "structure"], "bridge"],
                    [
                        "match",
                        ["get", "class"],
                        ["motorway_link", "trunk_link"],
                        true,
                        false
                    ],
                    ["<=", ["get", "layer"], 1],
                    ["==", ["geometry-type"], "LineString"]
                ],
                "layout": {"line-cap": ["step", ["zoom"], "butt", 13, "round"]},
                "paint": {
                    "line-width": [
                        "interpolate",
                        ["exponential", 1.5],
                        ["zoom"],
                        12,
                        0.8,
                        18,
                        20,
                        22,
                        200
                    ],
                    "line-color": [
                        "match",
                        ["get", "class"],
                        "motorway_link",
                        "rgba(229, 243, 255, 0.8)",
                        "rgba(230, 235, 254, 0.8)"
                    ],
                    "line-opacity": [
                        "interpolate",
                        ["linear"],
                        ["zoom"],
                        13,
                        1,
                        15,
                        0
                    ]
                }
            },
            {
                "id": "bridge-street",
                "type": "line",
                "metadata": {
                    "mapbox:featureComponent": "road-network",
                    "mapbox:group": "Road network, bridges"
                },
                "source": "composite",
                "source-layer": "road",
                "minzoom": 13,
                "filter": [
                    "all",
                    ["==", ["get", "structure"], "bridge"],
                    [
                        "match",
                        ["get", "class"],
                        ["street", "street_limited"],
                        true,
                        false
                    ],
                    ["==", ["geometry-type"], "LineString"]
                ],
                "layout": {"line-cap": ["step", ["zoom"], "butt", 14, "round"]},
                "paint": {
                    "line-width": [
                        "interpolate",
                        ["exponential", 1.5],
                        ["zoom"],
                        12,
                        0.5,
                        18,
                        20,
                        22,
                        200
                    ],
                    "line-color": [
                        "match",
                        ["get", "class"],
                        "street_limited",
                        "hsl(0, 2%, 22%)",
                        "hsla(0, 0%, 80%, 0.8)"
                    ],
                    "line-opacity": [
                        "interpolate",
                        ["linear"],
                        ["zoom"],
                        13,
                        1,
                        15,
                        0
                    ]
                }
            },
            {
                "id": "bridge-street-low",
                "type": "line",
                "metadata": {
                    "mapbox:featureComponent": "road-network",
                    "mapbox:group": "Road network, bridges"
                },
                "source": "composite",
                "source-layer": "road",
                "minzoom": 13,
                "maxzoom": 14,
                "filter": [
                    "all",
                    ["==", ["get", "structure"], "bridge"],
                    [
                        "match",
                        ["get", "class"],
                        ["street", "street_limited"],
                        true,
                        false
                    ],
                    ["==", ["geometry-type"], "LineString"]
                ],
                "layout": {
                    "line-cap": ["step", ["zoom"], "butt", 14, "round"],
                    "line-join": ["step", ["zoom"], "miter", 14, "round"]
                },
                "paint": {
                    "line-width": [
                        "interpolate",
                        ["exponential", 1.5],
                        ["zoom"],
                        12,
                        0.5,
                        18,
                        20,
                        22,
                        200
                    ],
                    "line-color": "hsla(0, 0%, 80%, 0.8)",
                    "line-opacity": [
                        "interpolate",
                        ["linear"],
                        ["zoom"],
                        13,
                        0.3,
                        15,
                        0
                    ]
                }
            },
            {
                "id": "bridge-secondary-tertiary",
                "type": "line",
                "metadata": {
                    "mapbox:featureComponent": "road-network",
                    "mapbox:group": "Road network, bridges"
                },
                "source": "composite",
                "source-layer": "road",
                "minzoom": 13,
                "filter": [
                    "all",
                    ["==", ["get", "structure"], "bridge"],
                    [
                        "match",
                        ["get", "class"],
                        ["secondary", "tertiary"],
                        true,
                        false
                    ],
                    ["==", ["geometry-type"], "LineString"]
                ],
                "layout": {"line-cap": ["step", ["zoom"], "butt", 14, "round"]},
                "paint": {
                    "line-width": [
                        "interpolate",
                        ["exponential", 1.5],
                        ["zoom"],
                        3,
                        0,
                        18,
                        26,
                        22,
                        260
                    ],
                    "line-color": "hsla(0, 0%, 80%, 0.8)",
                    "line-opacity": [
                        "interpolate",
                        ["linear"],
                        ["zoom"],
                        13,
                        0.3,
                        15,
                        0
                    ]
                }
            },
            {
                "id": "bridge-primary",
                "type": "line",
                "metadata": {
                    "mapbox:featureComponent": "road-network",
                    "mapbox:group": "Road network, bridges"
                },
                "source": "composite",
                "source-layer": "road",
                "minzoom": 13,
                "filter": [
                    "all",
                    ["==", ["get", "structure"], "bridge"],
                    ["==", ["get", "class"], "primary"],
                    ["==", ["geometry-type"], "LineString"]
                ],
                "layout": {"line-cap": ["step", ["zoom"], "butt", 14, "round"]},
                "paint": {
                    "line-width": [
                        "interpolate",
                        ["exponential", 1.5],
                        ["zoom"],
                        3,
                        0.8,
                        18,
                        28,
                        22,
                        280
                    ],
                    "line-color": "hsla(0, 0%, 80%, 0.8)",
                    "line-opacity": [
                        "interpolate",
                        ["linear"],
                        ["zoom"],
                        13,
                        0.3,
                        15,
                        0
                    ]
                }
            },
            {
                "id": "bridge-motorway-trunk",
                "type": "line",
                "metadata": {
                    "mapbox:featureComponent": "road-network",
                    "mapbox:group": "Road network, bridges"
                },
                "source": "composite",
                "source-layer": "road",
                "minzoom": 13,
                "filter": [
                    "all",
                    ["==", ["get", "structure"], "bridge"],
                    ["match", ["get", "class"], ["motorway", "trunk"], true, false],
                    ["<=", ["get", "layer"], 1],
                    ["==", ["geometry-type"], "LineString"]
                ],
                "layout": {"line-cap": ["step", ["zoom"], "butt", 14, "round"]},
                "paint": {
                    "line-width": [
                        "interpolate",
                        ["exponential", 1.5],
                        ["zoom"],
                        3,
                        0.8,
                        18,
                        30,
                        22,
                        300
                    ],
                    "line-color": [
                        "match",
                        ["get", "class"],
                        "motorway",
                        "rgba(229, 243, 255, 0.8)",
                        "rgba(230, 235, 254, 0.8)"
                    ],
                    "line-opacity": [
                        "interpolate",
                        ["linear"],
                        ["zoom"],
                        13,
                        1,
                        15,
                        0
                    ]
                }
            },
            {
                "id": "bridge-major-link-2-case",
                "type": "line",
                "metadata": {
                    "mapbox:featureComponent": "road-network",
                    "mapbox:group": "Road network, bridges"
                },
                "source": "composite",
                "source-layer": "road",
                "minzoom": 12,
                "filter": [
                    "all",
                    ["==", ["get", "structure"], "bridge"],
                    [">=", ["get", "layer"], 2],
                    [
                        "match",
                        ["get", "class"],
                        ["motorway_link", "trunk_link"],
                        true,
                        false
                    ],
                    ["==", ["geometry-type"], "LineString"]
                ],
                "paint": {
                    "line-width": [
                        "interpolate",
                        ["exponential", 1.5],
                        ["zoom"],
                        14,
                        0.8,
                        22,
                        2
                    ],
                    "line-color": "hsla(0, 1%, 22%, 0.7)",
                    "line-gap-width": [
                        "interpolate",
                        ["exponential", 1.5],
                        ["zoom"],
                        12,
                        0.8,
                        18,
                        20,
                        22,
                        200
                    ],
                    "line-opacity": [
                        "interpolate",
                        ["linear"],
                        ["zoom"],
                        13,
                        1,
                        15,
                        0
                    ]
                }
            },
            {
                "id": "bridge-motorway-trunk-2-case",
                "type": "line",
                "metadata": {
                    "mapbox:featureComponent": "road-network",
                    "mapbox:group": "Road network, bridges"
                },
                "source": "composite",
                "source-layer": "road",
                "minzoom": 13,
                "filter": [
                    "all",
                    ["==", ["get", "structure"], "bridge"],
                    [">=", ["get", "layer"], 2],
                    ["match", ["get", "class"], ["motorway", "trunk"], true, false],
                    ["==", ["geometry-type"], "LineString"]
                ],
                "paint": {
                    "line-width": [
                        "interpolate",
                        ["exponential", 1.5],
                        ["zoom"],
                        14,
                        1,
                        22,
                        2
                    ],
                    "line-color": "hsla(0, 1%, 22%, 0.7)",
                    "line-gap-width": [
                        "interpolate",
                        ["exponential", 1.5],
                        ["zoom"],
                        3,
                        0.8,
                        18,
                        30,
                        22,
                        300
                    ],
                    "line-opacity": [
                        "interpolate",
                        ["linear"],
                        ["zoom"],
                        13,
                        1,
                        15,
                        0
                    ]
                }
            },
            {
                "id": "bridge-major-link-2",
                "type": "line",
                "metadata": {
                    "mapbox:featureComponent": "road-network",
                    "mapbox:group": "Road network, bridges"
                },
                "source": "composite",
                "source-layer": "road",
                "minzoom": 12,
                "filter": [
                    "all",
                    ["==", ["get", "structure"], "bridge"],
                    [">=", ["get", "layer"], 2],
                    [
                        "match",
                        ["get", "class"],
                        ["motorway_link", "trunk_link"],
                        true,
                        false
                    ],
                    ["==", ["geometry-type"], "LineString"]
                ],
                "layout": {"line-cap": ["step", ["zoom"], "butt", 13, "round"]},
                "paint": {
                    "line-width": [
                        "interpolate",
                        ["exponential", 1.5],
                        ["zoom"],
                        12,
                        0.8,
                        18,
                        20,
                        22,
                        200
                    ],
                    "line-color": [
                        "match",
                        ["get", "class"],
                        "motorway_link",
                        "rgba(229, 243, 255, 0.8)",
                        "rgba(230, 235, 254, 0.8)"
                    ],
                    "line-opacity": [
                        "interpolate",
                        ["linear"],
                        ["zoom"],
                        13,
                        1,
                        15,
                        0
                    ]
                }
            },
            {
                "id": "bridge-motorway-trunk-2",
                "type": "line",
                "metadata": {
                    "mapbox:featureComponent": "road-network",
                    "mapbox:group": "Road network, bridges"
                },
                "source": "composite",
                "source-layer": "road",
                "minzoom": 13,
                "filter": [
                    "all",
                    ["==", ["get", "structure"], "bridge"],
                    [">=", ["get", "layer"], 2],
                    ["match", ["get", "class"], ["motorway", "trunk"], true, false],
                    ["==", ["geometry-type"], "LineString"]
                ],
                "layout": {"line-cap": ["step", ["zoom"], "butt", 14, "round"]},
                "paint": {
                    "line-width": [
                        "interpolate",
                        ["exponential", 1.5],
                        ["zoom"],
                        3,
                        0.8,
                        18,
                        30,
                        22,
                        300
                    ],
                    "line-color": [
                        "match",
                        ["get", "class"],
                        "motorway",
                        "rgba(229, 243, 255, 0.8)",
                        "rgba(230, 235, 254, 0.8)"
                    ],
                    "line-opacity": [
                        "interpolate",
                        ["linear"],
                        ["zoom"],
                        13,
                        1,
                        15,
                        0
                    ]
                }
            },
            {
                "id": "aerialway",
                "type": "line",
                "metadata": {
                    "mapbox:featureComponent": "transit",
                    "mapbox:group": "Transit, bridges"
                },
                "source": "composite",
                "source-layer": "road",
                "minzoom": 12,
                "filter": ["==", ["get", "class"], "aerialway"],
                "paint": {
                    "line-color": "hsl(204, 100%, 80%)",
                    "line-width": [
                        "interpolate",
                        ["exponential", 1.5],
                        ["zoom"],
                        14,
                        1,
                        20,
                        2
                    ],
                    "line-dasharray": [4, 1]
                }
            },
            {
                "id": "admin-1-boundary-bg",
                "type": "line",
                "metadata": {
                    "mapbox:featureComponent": "admin-boundaries",
                    "mapbox:group": "Administrative boundaries, admin"
                },
                "source": "composite",
                "source-layer": "admin",
                "minzoom": 7,
                "filter": [
                    "all",
                    ["==", ["get", "admin_level"], 1],
                    ["==", ["get", "maritime"], "false"],
                    ["match", ["get", "worldview"], ["all", "US"], true, false]
                ],
                "paint": {
                    "line-color": "hsl(260, 45%, 0%)",
                    "line-width": [
                        "interpolate",
                        ["linear"],
                        ["zoom"],
                        3,
                        3,
                        12,
                        6
                    ],
                    "line-opacity": [
                        "interpolate",
                        ["linear"],
                        ["zoom"],
                        7,
                        0,
                        8,
                        0.5
                    ],
                    "line-dasharray": [1, 0],
                    "line-blur": ["interpolate", ["linear"], ["zoom"], 3, 0, 12, 3]
                }
            },
            {
                "id": "admin-0-boundary-bg",
                "type": "line",
                "metadata": {
                    "mapbox:featureComponent": "admin-boundaries",
                    "mapbox:group": "Administrative boundaries, admin"
                },
                "source": "composite",
                "source-layer": "admin",
                "minzoom": 1,
                "filter": [
                    "all",
                    ["==", ["get", "admin_level"], 0],
                    ["==", ["get", "maritime"], "false"],
                    ["match", ["get", "worldview"], ["all", "US"], true, false]
                ],
                "paint": {
                    "line-width": [
                        "interpolate",
                        ["linear"],
                        ["zoom"],
                        3,
                        6,
                        12,
                        12
                    ],
                    "line-color": "hsl(260, 45%, 0%)",
                    "line-opacity": [
                        "interpolate",
                        ["linear"],
                        ["zoom"],
                        3,
                        0,
                        4,
                        0.5
                    ],
                    "line-blur": ["interpolate", ["linear"], ["zoom"], 3, 0, 12, 3]
                }
            },
            {
                "id": "admin-1-boundary",
                "type": "line",
                "metadata": {
                    "mapbox:featureComponent": "admin-boundaries",
                    "mapbox:group": "Administrative boundaries, admin"
                },
                "source": "composite",
                "source-layer": "admin",
                "minzoom": 2,
                "filter": [
                    "all",
                    ["==", ["get", "admin_level"], 1],
                    ["==", ["get", "maritime"], "false"],
                    ["match", ["get", "worldview"], ["all", "US"], true, false]
                ],
                "layout": {},
                "paint": {
                    "line-dasharray": [
                        "step",
                        ["zoom"],
                        ["literal", [2, 0]],
                        7,
                        ["literal", [2, 2, 6, 2]]
                    ],
                    "line-width": [
                        "interpolate",
                        ["linear"],
                        ["zoom"],
                        3,
                        0.3,
                        12,
                        1.5
                    ],
                    "line-opacity": [
                        "interpolate",
                        ["linear"],
                        ["zoom"],
                        2,
                        0,
                        3,
                        1
                    ],
                    "line-color": "hsl(260, 15%, 85%)"
                }
            },
            {
                "id": "admin-0-boundary",
                "type": "line",
                "metadata": {
                    "mapbox:featureComponent": "admin-boundaries",
                    "mapbox:group": "Administrative boundaries, admin"
                },
                "source": "composite",
                "source-layer": "admin",
                "minzoom": 1,
                "filter": [
                    "all",
                    ["==", ["get", "admin_level"], 0],
                    ["==", ["get", "disputed"], "false"],
                    ["==", ["get", "maritime"], "false"],
                    ["match", ["get", "worldview"], ["all", "US"], true, false]
                ],
                "layout": {},
                "paint": {
                    "line-color": "hsl(260, 15%, 80%)",
                    "line-width": [
                        "interpolate",
                        ["linear"],
                        ["zoom"],
                        3,
                        0.75,
                        12,
                        3
                    ],
                    "line-dasharray": [
                        "step",
                        ["zoom"],
                        ["literal", [2, 0]],
                        7,
                        ["literal", [2, 2, 6, 2]]
                    ]
                }
            },
            {
                "id": "admin-0-boundary-disputed",
                "type": "line",
                "metadata": {
                    "mapbox:featureComponent": "admin-boundaries",
                    "mapbox:group": "Administrative boundaries, admin"
                },
                "source": "composite",
                "source-layer": "admin",
                "minzoom": 1,
                "filter": [
                    "all",
                    ["==", ["get", "disputed"], "true"],
                    ["==", ["get", "admin_level"], 0],
                    ["==", ["get", "maritime"], "false"],
                    ["match", ["get", "worldview"], ["all", "US"], true, false]
                ],
                "paint": {
                    "line-color": "hsl(260, 15%, 80%)",
                    "line-width": [
                        "interpolate",
                        ["linear"],
                        ["zoom"],
                        3,
                        0.75,
                        12,
                        3
                    ],
                    "line-dasharray": [
                        "step",
                        ["zoom"],
                        ["literal", [3, 2, 5]],
                        7,
                        ["literal", [2, 1.5]]
                    ]
                }
            },
            {
                "id": "road-label",
                "type": "symbol",
                "metadata": {
                    "mapbox:featureComponent": "road-network",
                    "mapbox:group": "Road network, road-labels"
                },
                "source": "composite",
                "source-layer": "road",
                "minzoom": 10,
                "filter": [
                    "all",
                    ["has", "name"],
                    [
                        "step",
                        ["zoom"],
                        [
                            "match",
                            ["get", "class"],
                            [
                                "motorway",
                                "trunk",
                                "primary",
                                "secondary",
                                "tertiary"
                            ],
                            true,
                            false
                        ],
                        12,
                        [
                            "match",
                            ["get", "class"],
                            [
                                "motorway",
                                "trunk",
                                "primary",
                                "secondary",
                                "tertiary",
                                "street",
                                "street_limited"
                            ],
                            true,
                            false
                        ],
                        15,
                        [
                            "match",
                            ["get", "class"],
                            ["path", "pedestrian", "golf", "ferry", "aerialway"],
                            false,
                            true
                        ]
                    ],
                    [
                        "step",
                        ["pitch"],
                        true,
                        50,
                        ["<", ["distance-from-center"], 2],
                        60,
                        ["<", ["distance-from-center"], 2.5],
                        70,
                        ["<", ["distance-from-center"], 3]
                    ]
                ],
                "layout": {
                    "text-size": [
                        "interpolate",
                        ["linear"],
                        ["zoom"],
                        10,
                        [
                            "match",
                            ["get", "class"],
                            [
                                "motorway",
                                "trunk",
                                "primary",
                                "secondary",
                                "tertiary"
                            ],
                            11,
                            [
                                "motorway_link",
                                "trunk_link",
                                "primary_link",
                                "secondary_link",
                                "tertiary_link",
                                "street",
                                "street_limited"
                            ],
                            9.9,
                            7.15
                        ],
                        18,
                        [
                            "match",
                            ["get", "class"],
                            [
                                "motorway",
                                "trunk",
                                "primary",
                                "secondary",
                                "tertiary"
                            ],
                            17.6,
                            [
                                "motorway_link",
                                "trunk_link",
                                "primary_link",
                                "secondary_link",
                                "tertiary_link",
                                "street",
                                "street_limited"
                            ],
                            15.400000000000002,
                            14.3
                        ]
                    ],
                    "text-max-angle": 30,
                    "text-font": ["Manrope Regular", "Arial Unicode MS Regular"],
                    "symbol-placement": "line",
                    "text-padding": 5,
                    "text-rotation-alignment": "map",
                    "text-pitch-alignment": "viewport",
                    "text-field": ["coalesce", ["get", "name_en"], ["get", "name"]],
                    "text-letter-spacing": 0.01
                },
                "paint": {
                    "text-color": "hsl(0, 0%, 100%)",
                    "text-halo-color": [
                        "match",
                        ["get", "class"],
                        ["motorway", "trunk"],
                        "hsla(0, 5%, 0%, 0.75)",
                        "hsl(0, 5%, 0%)"
                    ],
                    "text-halo-width": 1,
                    "text-halo-blur": 1
                }
            },
            {
                "id": "road-intersection",
                "type": "symbol",
                "metadata": {
                    "mapbox:featureComponent": "road-network",
                    "mapbox:group": "Road network, road-labels"
                },
                "source": "composite",
                "source-layer": "road",
                "minzoom": 15,
                "filter": [
                    "all",
                    ["==", ["get", "class"], "intersection"],
                    ["has", "name"],
                    [
                        "step",
                        ["pitch"],
                        true,
                        50,
                        ["<", ["distance-from-center"], 1],
                        60,
                        ["<", ["distance-from-center"], 1.5],
                        70,
                        ["<", ["distance-from-center"], 2]
                    ]
                ],
                "layout": {
                    "text-field": ["coalesce", ["get", "name_en"], ["get", "name"]],
                    "icon-image": "intersection",
                    "icon-text-fit": "both",
                    "icon-text-fit-padding": [1, 2, 1, 2],
                    "text-size": [
                        "interpolate",
                        ["exponential", 1.2],
                        ["zoom"],
                        15,
                        9,
                        18,
                        12
                    ],
                    "text-font": ["Manrope Bold", "Arial Unicode MS Bold"]
                },
                "paint": {"text-color": "hsl(230, 36%, 64%)"}
            },
            {
                "id": "road-number-shield",
                "type": "symbol",
                "metadata": {
                    "mapbox:featureComponent": "road-network",
                    "mapbox:group": "Road network, road-labels"
                },
                "source": "composite",
                "source-layer": "road",
                "minzoom": 6,
                "filter": [
                    "all",
                    [
                        "case",
                        ["has", "reflen"],
                        ["<=", ["get", "reflen"], 6],
                        ["has", "shield_beta"]
                    ],
                    [
                        "match",
                        ["get", "class"],
                        ["pedestrian", "service"],
                        false,
                        true
                    ],
                    [
                        "step",
                        ["zoom"],
                        ["==", ["geometry-type"], "Point"],
                        11,
                        [">", ["get", "len"], 5000],
                        12,
                        [">", ["get", "len"], 2500],
                        13,
                        [">", ["get", "len"], 1000],
                        14,
                        true
                    ],
                    [
                        "step",
                        ["pitch"],
                        true,
                        50,
                        ["<", ["distance-from-center"], 2],
                        60,
                        ["<", ["distance-from-center"], 2.5],
                        70,
                        ["<", ["distance-from-center"], 3]
                    ]
                ],
                "layout": {
                    "text-size": 9,
                    "icon-image": [
                        "case",
                        ["has", "shield_beta"],
                        [
                            "coalesce",
                            [
                                "image",
                                [
                                    "concat",
                                    ["get", "shield_beta"],
                                    "-",
                                    ["to-string", ["get", "reflen"]]
                                ]
                            ],
                            [
                                "image",
                                [
                                    "concat",
                                    ["get", "shield"],
                                    "-",
                                    ["to-string", ["get", "reflen"]]
                                ]
                            ],
                            [
                                "image",
                                [
                                    "concat",
                                    "default-",
                                    ["to-string", ["get", "reflen"]]
                                ]
                            ]
                        ],
                        [
                            "concat",
                            ["get", "shield"],
                            "-",
                            ["to-string", ["get", "reflen"]]
                        ]
                    ],
                    "icon-rotation-alignment": "viewport",
                    "text-max-angle": 38,
                    "symbol-spacing": [
                        "interpolate",
                        ["linear"],
                        ["zoom"],
                        11,
                        400,
                        14,
                        600
                    ],
                    "text-font": ["Manrope Bold", "Arial Unicode MS Bold"],
                    "symbol-placement": ["step", ["zoom"], "point", 11, "line"],
                    "text-rotation-alignment": "viewport",
                    "text-field": ["get", "ref"],
                    "text-letter-spacing": 0.05
                },
                "paint": {
                    "text-color": [
                        "case",
                        ["has", "shield_beta"],
                        [
                            "case",
                            [
                                "all",
                                ["has", "shield_text_color_beta"],
                                [
                                    "to-boolean",
                                    [
                                        "coalesce",
                                        [
                                            "image",
                                            [
                                                "concat",
                                                ["get", "shield_beta"],
                                                "-",
                                                ["to-string", ["get", "reflen"]]
                                            ]
                                        ],
                                        ""
                                    ]
                                ]
                            ],
                            [
                                "match",
                                ["get", "shield_text_color_beta"],
                                "white",
                                "hsl(0, 0%, 100%)",
                                "yellow",
                                "hsl(50, 63%, 70%)",
                                "orange",
                                "hsl(25, 63%, 75%)",
                                "blue",
                                "hsl(230, 36%, 44%)",
                                "red",
                                "hsl(0, 54%, 59%)",
                                "green",
                                "hsl(140, 46%, 37%)",
                                "hsl(230, 11%, 13%)"
                            ],
                            "hsl(230, 11%, 13%)"
                        ],
                        [
                            "match",
                            ["get", "shield_text_color"],
                            "white",
                            "hsl(0, 0%, 100%)",
                            "yellow",
                            "hsl(50, 63%, 70%)",
                            "orange",
                            "hsl(25, 63%, 75%)",
                            "blue",
                            "hsl(230, 36%, 44%)",
                            "red",
                            "hsl(0, 54%, 59%)",
                            "green",
                            "hsl(140, 46%, 37%)",
                            "hsl(230, 11%, 13%)"
                        ]
                    ]
                }
            },
            {
                "id": "road-exit-shield",
                "type": "symbol",
                "metadata": {
                    "mapbox:featureComponent": "road-network",
                    "mapbox:group": "Road network, road-labels"
                },
                "source": "composite",
                "source-layer": "motorway_junction",
                "minzoom": 14,
                "filter": [
                    "all",
                    ["has", "reflen"],
                    ["<=", ["get", "reflen"], 9],
                    [
                        "step",
                        ["pitch"],
                        true,
                        50,
                        ["<", ["distance-from-center"], 1],
                        60,
                        ["<", ["distance-from-center"], 1.5],
                        70,
                        ["<", ["distance-from-center"], 2]
                    ]
                ],
                "layout": {
                    "text-field": ["get", "ref"],
                    "text-size": 9,
                    "icon-image": [
                        "concat",
                        "motorway-exit-",
                        ["to-string", ["get", "reflen"]]
                    ],
                    "text-font": ["Manrope Bold", "Arial Unicode MS Bold"]
                },
                "paint": {
                    "text-color": "hsl(0, 0%, 100%)",
                    "text-translate": [0, 0]
                }
            },
            {
                "id": "path-pedestrian-label",
                "type": "symbol",
                "metadata": {
                    "mapbox:featureComponent": "walking-cycling",
                    "mapbox:group": "Walking, cycling, etc., walking-cycling-labels"
                },
                "source": "composite",
                "source-layer": "road",
                "minzoom": 12,
                "filter": [
                    "all",
                    ["case", ["has", "layer"], [">=", ["get", "layer"], 0], true],
                    [
                        "step",
                        ["zoom"],
                        ["match", ["get", "class"], ["pedestrian"], true, false],
                        15,
                        [
                            "match",
                            ["get", "class"],
                            ["path", "pedestrian"],
                            true,
                            false
                        ]
                    ],
                    [
                        "step",
                        ["pitch"],
                        true,
                        50,
                        ["<", ["distance-from-center"], 1],
                        60,
                        ["<", ["distance-from-center"], 1.5],
                        70,
                        ["<", ["distance-from-center"], 2]
                    ]
                ],
                "layout": {
                    "text-size": [
                        "interpolate",
                        ["linear"],
                        ["zoom"],
                        10,
                        ["match", ["get", "class"], "pedestrian", 9.9, 7.15],
                        18,
                        [
                            "match",
                            ["get", "class"],
                            "pedestrian",
                            15.400000000000002,
                            14.3
                        ]
                    ],
                    "text-max-angle": 30,
                    "text-font": ["Manrope Regular", "Arial Unicode MS Regular"],
                    "symbol-placement": "line",
                    "text-padding": 1,
                    "text-rotation-alignment": "map",
                    "text-pitch-alignment": "viewport",
                    "text-field": ["coalesce", ["get", "name_en"], ["get", "name"]],
                    "text-letter-spacing": 0.01
                },
                "paint": {
                    "text-color": "hsl(0, 0%, 100%)",
                    "text-halo-color": "hsl(0, 5%, 0%)",
                    "text-halo-width": 1,
                    "text-halo-blur": 1
                }
            },
            {
                "id": "ferry-aerialway-label",
                "type": "symbol",
                "metadata": {
                    "mapbox:featureComponent": "transit",
                    "mapbox:group": "Transit, ferry-aerialway-labels"
                },
                "source": "composite",
                "source-layer": "road",
                "minzoom": 15,
                "filter": [
                    "all",
                    ["match", ["get", "class"], "aerialway", true, false],
                    [
                        "step",
                        ["pitch"],
                        true,
                        50,
                        ["<", ["distance-from-center"], 1],
                        60,
                        ["<", ["distance-from-center"], 1.5],
                        70,
                        ["<", ["distance-from-center"], 2]
                    ]
                ],
                "layout": {
                    "text-size": [
                        "interpolate",
                        ["linear"],
                        ["zoom"],
                        10,
                        7.15,
                        18,
                        14.3
                    ],
                    "text-max-angle": 30,
                    "text-font": ["Manrope Regular", "Arial Unicode MS Regular"],
                    "symbol-placement": "line",
                    "text-padding": 1,
                    "text-rotation-alignment": "map",
                    "text-pitch-alignment": "viewport",
                    "text-field": ["coalesce", ["get", "name_en"], ["get", "name"]],
                    "text-letter-spacing": 0.01
                },
                "paint": {
                    "text-color": [
                        "match",
                        ["get", "class"],
                        "ferry",
                        "hsl(240, 68%, 94%)",
                        "hsl(204, 100%, 80%)"
                    ],
                    "text-halo-color": [
                        "match",
                        ["get", "class"],
                        "ferry",
                        "hsl(240, 100%, 62%)",
                        "hsl(0, 0%, 10%)"
                    ],
                    "text-halo-width": 1,
                    "text-halo-blur": 1
                }
            },
            {
                "id": "waterway-label",
                "type": "symbol",
                "metadata": {
                    "mapbox:featureComponent": "natural-features",
                    "mapbox:group": "Natural features, natural-labels"
                },
                "source": "composite",
                "source-layer": "natural_label",
                "minzoom": 13,
                "filter": [
                    "all",
                    [
                        "match",
                        ["get", "class"],
                        [
                            "canal",
                            "river",
                            "stream",
                            "disputed_canal",
                            "disputed_river",
                            "disputed_stream"
                        ],
                        ["match", ["get", "worldview"], ["all", "US"], true, false],
                        false
                    ],
                    [
                        "step",
                        ["pitch"],
                        true,
                        50,
                        ["<", ["distance-from-center"], 1],
                        60,
                        ["<", ["distance-from-center"], 1.5],
                        70,
                        ["<", ["distance-from-center"], 2]
                    ],
                    ["==", ["geometry-type"], "LineString"]
                ],
                "layout": {
                    "text-font": ["Manrope Light", "Arial Unicode MS Regular"],
                    "text-max-angle": 30,
                    "symbol-spacing": [
                        "interpolate",
                        ["linear", 1],
                        ["zoom"],
                        15,
                        250,
                        17,
                        400
                    ],
                    "text-size": [
                        "interpolate",
                        ["linear"],
                        ["zoom"],
                        13,
                        12,
                        18,
                        18
                    ],
                    "symbol-placement": "line",
                    "text-pitch-alignment": "viewport",
                    "text-field": ["coalesce", ["get", "name_en"], ["get", "name"]]
                },
                "paint": {
                    "text-color": "hsl(240, 68%, 90%)",
                    "text-halo-color": "hsla(0, 0%, 0%, 0.5)",
                    "text-halo-width": 1,
                    "text-halo-blur": 1
                }
            },
            {
                "id": "natural-line-label",
                "type": "symbol",
                "metadata": {
                    "mapbox:featureComponent": "natural-features",
                    "mapbox:group": "Natural features, natural-labels"
                },
                "source": "composite",
                "source-layer": "natural_label",
                "minzoom": 4,
                "filter": [
                    "all",
                    [
                        "match",
                        ["get", "class"],
                        [
                            "glacier",
                            "landform",
                            "disputed_glacier",
                            "disputed_landform"
                        ],
                        ["match", ["get", "worldview"], ["all", "US"], true, false],
                        false
                    ],
                    ["<=", ["get", "filterrank"], 2],
                    [
                        "step",
                        ["pitch"],
                        true,
                        50,
                        ["<", ["distance-from-center"], 1],
                        60,
                        ["<", ["distance-from-center"], 1.5],
                        70,
                        ["<", ["distance-from-center"], 2]
                    ],
                    ["==", ["geometry-type"], "LineString"]
                ],
                "layout": {
                    "text-size": [
                        "step",
                        ["zoom"],
                        ["step", ["get", "sizerank"], 18, 5, 12],
                        17,
                        ["step", ["get", "sizerank"], 18, 13, 12]
                    ],
                    "text-max-angle": 30,
                    "text-field": ["coalesce", ["get", "name_en"], ["get", "name"]],
                    "text-font": ["Manrope Medium", "Arial Unicode MS Bold"],
                    "symbol-placement": "line-center",
                    "text-pitch-alignment": "viewport"
                },
                "paint": {
                    "text-halo-width": 0.5,
                    "text-halo-color": "hsl(0, 0%, 0%)",
                    "text-halo-blur": 0.5,
                    "text-color": "hsl(0, 0%, 100%)"
                }
            },
            {
                "id": "natural-point-label",
                "type": "symbol",
                "metadata": {
                    "mapbox:featureComponent": "natural-features",
                    "mapbox:group": "Natural features, natural-labels"
                },
                "source": "composite",
                "source-layer": "natural_label",
                "minzoom": 4,
                "filter": [
                    "all",
                    [
                        "match",
                        ["get", "class"],
                        [
                            "dock",
                            "glacier",
                            "landform",
                            "water_feature",
                            "wetland",
                            "disputed_dock",
                            "disputed_glacier",
                            "disputed_landform",
                            "disputed_water_feature",
                            "disputed_wetland"
                        ],
                        ["match", ["get", "worldview"], ["all", "US"], true, false],
                        false
                    ],
                    ["<=", ["get", "filterrank"], 2],
                    [
                        "step",
                        ["pitch"],
                        true,
                        50,
                        ["<", ["distance-from-center"], 1],
                        60,
                        ["<", ["distance-from-center"], 1.5],
                        70,
                        ["<", ["distance-from-center"], 2]
                    ],
                    ["==", ["geometry-type"], "Point"]
                ],
                "layout": {
                    "text-size": [
                        "step",
                        ["zoom"],
                        ["step", ["get", "sizerank"], 18, 5, 12],
                        17,
                        ["step", ["get", "sizerank"], 18, 13, 12]
                    ],
                    "icon-image": [
                        "case",
                        ["has", "maki_beta"],
                        [
                            "coalesce",
                            ["image", ["get", "maki_beta"]],
                            ["image", ["get", "maki"]]
                        ],
                        ["image", ["get", "maki"]]
                    ],
                    "text-font": ["Manrope Medium", "Arial Unicode MS Bold"],
                    "text-offset": [
                        "step",
                        ["zoom"],
                        [
                            "step",
                            ["get", "sizerank"],
                            ["literal", [0, 0]],
                            5,
                            ["literal", [0, 0.55]]
                        ],
                        17,
                        [
                            "step",
                            ["get", "sizerank"],
                            ["literal", [0, 0]],
                            13,
                            ["literal", [0, 0.6000000000000001]]
                        ]
                    ],
                    "text-anchor": [
                        "step",
                        ["zoom"],
                        ["step", ["get", "sizerank"], "center", 5, "top"],
                        17,
                        ["step", ["get", "sizerank"], "center", 13, "top"]
                    ],
                    "text-field": ["coalesce", ["get", "name_en"], ["get", "name"]]
                },
                "paint": {
                    "icon-opacity": [
                        "step",
                        ["zoom"],
                        ["step", ["get", "sizerank"], 0, 5, 1],
                        17,
                        ["step", ["get", "sizerank"], 0, 13, 1]
                    ],
                    "text-halo-color": "hsl(0, 0%, 10%)",
                    "text-halo-width": 0.5,
                    "text-halo-blur": 0.5,
                    "text-color": "hsl(0, 0%, 100%)"
                }
            },
            {
                "id": "water-line-label",
                "type": "symbol",
                "metadata": {
                    "mapbox:featureComponent": "natural-features",
                    "mapbox:group": "Natural features, natural-labels"
                },
                "source": "composite",
                "source-layer": "natural_label",
                "minzoom": 1,
                "filter": [
                    "all",
                    [
                        "match",
                        ["get", "class"],
                        [
                            "bay",
                            "ocean",
                            "reservoir",
                            "sea",
                            "water",
                            "disputed_bay",
                            "disputed_ocean",
                            "disputed_reservoir",
                            "disputed_sea",
                            "disputed_water"
                        ],
                        ["match", ["get", "worldview"], ["all", "US"], true, false],
                        false
                    ],
                    [
                        "step",
                        ["pitch"],
                        true,
                        50,
                        ["<", ["distance-from-center"], 1],
                        60,
                        ["<", ["distance-from-center"], 1.5],
                        70,
                        ["<", ["distance-from-center"], 2]
                    ],
                    ["==", ["geometry-type"], "LineString"]
                ],
                "layout": {
                    "text-size": [
                        "interpolate",
                        ["linear"],
                        ["zoom"],
                        0,
                        ["*", ["-", 16, ["sqrt", ["get", "sizerank"]]], 1],
                        22,
                        ["*", ["-", 22, ["sqrt", ["get", "sizerank"]]], 1]
                    ],
                    "text-max-angle": 30,
                    "text-letter-spacing": [
                        "match",
                        ["get", "class"],
                        "ocean",
                        0.25,
                        ["sea", "bay"],
                        0.15,
                        0
                    ],
                    "text-font": ["Manrope Light", "Arial Unicode MS Regular"],
                    "symbol-placement": "line-center",
                    "text-pitch-alignment": "viewport",
                    "text-field": ["coalesce", ["get", "name_en"], ["get", "name"]]
                },
                "paint": {
                    "text-color": [
                        "match",
                        ["get", "class"],
                        ["bay", "ocean", "sea"],
                        "hsl(240, 96%, 82%)",
                        "hsl(240, 68%, 90%)"
                    ],
                    "text-halo-color": "hsla(0, 0%, 0%, 0.5)",
                    "text-halo-width": 1,
                    "text-halo-blur": 1
                }
            },
            {
                "id": "water-point-label",
                "type": "symbol",
                "metadata": {
                    "mapbox:featureComponent": "natural-features",
                    "mapbox:group": "Natural features, natural-labels"
                },
                "source": "composite",
                "source-layer": "natural_label",
                "minzoom": 1,
                "filter": [
                    "all",
                    [
                        "match",
                        ["get", "class"],
                        [
                            "bay",
                            "ocean",
                            "reservoir",
                            "sea",
                            "water",
                            "disputed_bay",
                            "disputed_ocean",
                            "disputed_reservoir",
                            "disputed_sea",
                            "disputed_water"
                        ],
                        ["match", ["get", "worldview"], ["all", "US"], true, false],
                        false
                    ],
                    [
                        "step",
                        ["pitch"],
                        true,
                        50,
                        ["<", ["distance-from-center"], 1],
                        60,
                        ["<", ["distance-from-center"], 1.5],
                        70,
                        ["<", ["distance-from-center"], 2]
                    ],
                    ["==", ["geometry-type"], "Point"]
                ],
                "layout": {
                    "text-line-height": 1.3,
                    "text-size": [
                        "interpolate",
                        ["linear"],
                        ["zoom"],
                        0,
                        ["*", ["-", 16, ["sqrt", ["get", "sizerank"]]], 1],
                        22,
                        ["*", ["-", 22, ["sqrt", ["get", "sizerank"]]], 1]
                    ],
                    "text-font": ["Manrope Light", "Arial Unicode MS Regular"],
                    "text-field": ["coalesce", ["get", "name_en"], ["get", "name"]],
                    "text-letter-spacing": [
                        "match",
                        ["get", "class"],
                        "ocean",
                        0.25,
                        ["bay", "sea"],
                        0.15,
                        0.01
                    ],
                    "text-max-width": [
                        "match",
                        ["get", "class"],
                        "ocean",
                        4,
                        "sea",
                        5,
                        ["bay", "water"],
                        7,
                        10
                    ]
                },
                "paint": {
                    "text-color": [
                        "match",
                        ["get", "class"],
                        ["bay", "ocean", "sea"],
                        "hsl(240, 96%, 82%)",
                        "hsl(240, 68%, 90%)"
                    ],
                    "text-halo-color": "hsla(0, 0%, 0%, 0.5)",
                    "text-halo-width": 1,
                    "text-halo-blur": 1
                }
            },
            {
                "id": "poi-label",
                "type": "symbol",
                "metadata": {
                    "mapbox:featureComponent": "point-of-interest-labels",
                    "mapbox:group": "Point of interest labels, poi-labels"
                },
                "source": "composite",
                "source-layer": "poi_label",
                "minzoom": 6,
                "filter": [
                    "all",
                    [
                        "<=",
                        ["get", "filterrank"],
                        ["+", ["step", ["zoom"], 0, 16, 1, 17, 2], 3]
                    ],
                    [
                        "step",
                        ["pitch"],
                        true,
                        50,
                        ["<", ["distance-from-center"], 2],
                        60,
                        ["<", ["distance-from-center"], 2.5],
                        70,
                        ["<", ["distance-from-center"], 3]
                    ]
                ],
                "layout": {
                    "text-size": [
                        "step",
                        ["zoom"],
                        ["step", ["get", "sizerank"], 18, 5, 12],
                        17,
                        ["step", ["get", "sizerank"], 18, 13, 12]
                    ],
                    "icon-image": [
                        "case",
                        ["has", "maki_beta"],
                        [
                            "coalesce",
                            ["image", ["get", "maki_beta"]],
                            ["image", ["get", "maki"]]
                        ],
                        ["image", ["get", "maki"]]
                    ],
                    "text-font": ["Manrope Medium", "Arial Unicode MS Bold"],
                    "text-offset": [
                        "step",
                        ["zoom"],
                        [
                            "step",
                            ["get", "sizerank"],
                            ["literal", [0, 0]],
                            5,
                            ["literal", [0, 0.8]]
                        ],
                        17,
                        [
                            "step",
                            ["get", "sizerank"],
                            ["literal", [0, 0]],
                            13,
                            ["literal", [0, 0.8]]
                        ]
                    ],
                    "text-anchor": [
                        "step",
                        ["zoom"],
                        ["step", ["get", "sizerank"], "center", 5, "top"],
                        17,
                        ["step", ["get", "sizerank"], "center", 13, "top"]
                    ],
                    "text-field": ["coalesce", ["get", "name_en"], ["get", "name"]]
                },
                "paint": {
                    "icon-opacity": [
                        "step",
                        ["zoom"],
                        ["step", ["get", "sizerank"], 0, 5, 1],
                        17,
                        ["step", ["get", "sizerank"], 0, 13, 1]
                    ],
                    "text-halo-color": "hsl(0, 0%, 10%)",
                    "text-halo-width": 0.5,
                    "text-halo-blur": 0.5,
                    "text-color": [
                        "match",
                        ["get", "class"],
                        "park_like",
                        "hsl(110, 100%, 85%)",
                        "education",
                        "hsl(30, 100%, 85%)",
                        "medical",
                        "hsl(0, 100%, 85%)",
                        "hsl(0, 0%, 100%)"
                    ]
                }
            },
            {
                "id": "transit-label",
                "type": "symbol",
                "metadata": {
                    "mapbox:featureComponent": "transit",
                    "mapbox:group": "Transit, transit-labels"
                },
                "source": "composite",
                "source-layer": "transit_stop_label",
                "minzoom": 12,
                "filter": [
                    "all",
                    [
                        "step",
                        ["zoom"],
                        [
                            "all",
                            ["<=", ["get", "filterrank"], 4],
                            [
                                "match",
                                ["get", "mode"],
                                "rail",
                                true,
                                "metro_rail",
                                true,
                                false
                            ],
                            ["!=", ["get", "stop_type"], "entrance"]
                        ],
                        14,
                        [
                            "all",
                            [
                                "match",
                                ["get", "mode"],
                                "rail",
                                true,
                                "metro_rail",
                                true,
                                false
                            ],
                            ["!=", ["get", "stop_type"], "entrance"]
                        ],
                        15,
                        [
                            "all",
                            [
                                "match",
                                ["get", "mode"],
                                "rail",
                                true,
                                "metro_rail",
                                true,
                                "light_rail",
                                true,
                                false
                            ],
                            ["!=", ["get", "stop_type"], "entrance"]
                        ],
                        16,
                        [
                            "all",
                            [
                                "match",
                                ["get", "mode"],
                                "ferry",
                                false,
                                "bus",
                                false,
                                true
                            ],
                            ["!=", ["get", "stop_type"], "entrance"]
                        ],
                        17,
                        [
                            "all",
                            ["match", ["get", "mode"], "ferry", false, true],
                            ["!=", ["get", "stop_type"], "entrance"]
                        ],
                        19,
                        ["match", ["get", "mode"], "ferry", false, true]
                    ],
                    [
                        "step",
                        ["pitch"],
                        true,
                        50,
                        ["<", ["distance-from-center"], 1],
                        60,
                        ["<", ["distance-from-center"], 1.5],
                        70,
                        ["<", ["distance-from-center"], 2]
                    ]
                ],
                "layout": {
                    "text-size": 12,
                    "icon-image": ["get", "network"],
                    "text-font": ["Manrope Medium", "Arial Unicode MS Bold"],
                    "text-justify": [
                        "match",
                        ["get", "stop_type"],
                        "entrance",
                        "left",
                        "center"
                    ],
                    "text-offset": [
                        "match",
                        ["get", "stop_type"],
                        "entrance",
                        ["literal", [1, 0]],
                        ["literal", [0, 0.8]]
                    ],
                    "text-anchor": [
                        "match",
                        ["get", "stop_type"],
                        "entrance",
                        "left",
                        "top"
                    ],
                    "text-field": [
                        "step",
                        ["zoom"],
                        "",
                        13,
                        [
                            "match",
                            ["get", "mode"],
                            ["rail", "metro_rail"],
                            ["coalesce", ["get", "name_en"], ["get", "name"]],
                            ""
                        ],
                        14,
                        [
                            "match",
                            ["get", "mode"],
                            ["bus", "bicycle"],
                            "",
                            ["coalesce", ["get", "name_en"], ["get", "name"]]
                        ],
                        18,
                        ["coalesce", ["get", "name_en"], ["get", "name"]]
                    ],
                    "text-letter-spacing": 0.01,
                    "text-max-width": [
                        "match",
                        ["get", "stop_type"],
                        "entrance",
                        15,
                        9
                    ]
                },
                "paint": {
                    "text-halo-color": "hsl(0, 0%, 10%)",
                    "text-color": "hsl(204, 100%, 80%)",
                    "text-halo-blur": 0.5,
                    "text-halo-width": 0.5
                }
            },
            {
                "id": "airport-label",
                "type": "symbol",
                "metadata": {
                    "mapbox:featureComponent": "transit",
                    "mapbox:group": "Transit, transit-labels"
                },
                "source": "composite",
                "source-layer": "airport_label",
                "minzoom": 8,
                "filter": [
                    "all",
                    [
                        "match",
                        ["get", "class"],
                        [
                            "military",
                            "civil",
                            "disputed_military",
                            "disputed_civil"
                        ],
                        ["match", ["get", "worldview"], ["all", "US"], true, false],
                        false
                    ],
                    [
                        "step",
                        ["pitch"],
                        true,
                        50,
                        ["<", ["distance-from-center"], 3],
                        60,
                        ["<", ["distance-from-center"], 4],
                        70,
                        ["<", ["distance-from-center"], 5]
                    ]
                ],
                "layout": {
                    "text-line-height": 1.1,
                    "text-size": ["step", ["get", "sizerank"], 18, 9, 12],
                    "icon-image": ["get", "maki"],
                    "text-font": ["Manrope Medium", "Arial Unicode MS Bold"],
                    "text-offset": [0, 0.8],
                    "text-rotation-alignment": "viewport",
                    "text-anchor": "top",
                    "text-field": [
                        "step",
                        ["get", "sizerank"],
                        [
                            "case",
                            ["has", "ref"],
                            [
                                "concat",
                                ["get", "ref"],
                                ["coalesce", ["get", "name_en"], ["get", "name"]]
                            ],
                            ["coalesce", ["get", "name_en"], ["get", "name"]]
                        ],
                        15,
                        ["get", "ref"]
                    ],
                    "text-letter-spacing": 0.01,
                    "text-max-width": 9
                },
                "paint": {
                    "text-color": "hsl(0, 0%, 100%)",
                    "text-halo-color": "hsl(0, 0%, 10%)",
                    "text-halo-width": 1
                }
            },
            {
                "id": "settlement-subdivision-label",
                "type": "symbol",
                "metadata": {
                    "mapbox:featureComponent": "place-labels",
                    "mapbox:group": "Place labels, place-labels"
                },
                "source": "composite",
                "source-layer": "place_label",
                "minzoom": 10,
                "maxzoom": 15,
                "filter": [
                    "all",
                    [
                        "match",
                        ["get", "class"],
                        [
                            "settlement_subdivision",
                            "disputed_settlement_subdivision"
                        ],
                        ["match", ["get", "worldview"], ["all", "US"], true, false],
                        false
                    ],
                    ["<=", ["get", "filterrank"], 4],
                    [
                        "step",
                        ["pitch"],
                        true,
                        50,
                        ["<", ["distance-from-center"], 3],
                        60,
                        ["<", ["distance-from-center"], 4],
                        70,
                        ["<", ["distance-from-center"], 5]
                    ]
                ],
                "layout": {
                    "text-field": ["coalesce", ["get", "name_en"], ["get", "name"]],
                    "text-transform": "uppercase",
                    "text-font": ["Manrope Regular", "Arial Unicode MS Regular"],
                    "text-letter-spacing": [
                        "match",
                        ["get", "type"],
                        "suburb",
                        0.15,
                        0.05
                    ],
                    "text-max-width": 7,
                    "text-padding": 3,
                    "text-size": [
                        "interpolate",
                        ["cubic-bezier", 0.5, 0, 1, 1],
                        ["zoom"],
                        11,
                        [
                            "match",
                            ["get", "type"],
                            "suburb",
                            12.100000000000001,
                            11.55
                        ],
                        15,
                        [
                            "match",
                            ["get", "type"],
                            "suburb",
                            16.5,
                            15.400000000000002
                        ]
                    ]
                },
                "paint": {
                    "text-halo-color": "hsla(0, 5%, 0%, 0.75)",
                    "text-halo-width": 1,
                    "text-color": "hsl(0, 0%, 100%)",
                    "text-halo-blur": 0.5
                }
            },
            {
                "id": "settlement-minor-label",
                "type": "symbol",
                "metadata": {
                    "mapbox:featureComponent": "place-labels",
                    "mapbox:group": "Place labels, place-labels"
                },
                "source": "composite",
                "source-layer": "place_label",
                "minzoom": 2,
                "maxzoom": 13,
                "filter": [
                    "all",
                    ["<=", ["get", "filterrank"], 3],
                    [
                        "match",
                        ["get", "class"],
                        ["settlement", "disputed_settlement"],
                        ["match", ["get", "worldview"], ["all", "US"], true, false],
                        false
                    ],
                    [
                        "step",
                        ["zoom"],
                        [">", ["get", "symbolrank"], 6],
                        4,
                        [">=", ["get", "symbolrank"], 7],
                        6,
                        [">=", ["get", "symbolrank"], 8],
                        7,
                        [">=", ["get", "symbolrank"], 10],
                        10,
                        [">=", ["get", "symbolrank"], 11],
                        11,
                        [">=", ["get", "symbolrank"], 13],
                        12,
                        [">=", ["get", "symbolrank"], 15]
                    ],
                    [
                        "step",
                        ["pitch"],
                        true,
                        50,
                        ["<", ["distance-from-center"], 3],
                        60,
                        ["<", ["distance-from-center"], 4],
                        70,
                        ["<", ["distance-from-center"], 5]
                    ]
                ],
                "layout": {
                    "text-line-height": 1.1,
                    "text-size": [
                        "interpolate",
                        ["cubic-bezier", 0.2, 0, 0.9, 1],
                        ["zoom"],
                        3,
                        ["step", ["get", "symbolrank"], 12.100000000000001, 9, 11],
                        6,
                        [
                            "step",
                            ["get", "symbolrank"],
                            15.400000000000002,
                            9,
                            13.200000000000001,
                            12,
                            11
                        ],
                        8,
                        [
                            "step",
                            ["get", "symbolrank"],
                            17.6,
                            9,
                            15.400000000000002,
                            12,
                            13.200000000000001,
                            15,
                            11
                        ],
                        13,
                        [
                            "step",
                            ["get", "symbolrank"],
                            24.200000000000003,
                            9,
                            22,
                            12,
                            17.6,
                            15,
                            15.400000000000002
                        ]
                    ],
                    "text-radial-offset": [
                        "step",
                        ["zoom"],
                        ["match", ["get", "capital"], 2, 0.6, 0.55],
                        8,
                        0
                    ],
                    "symbol-sort-key": ["get", "symbolrank"],
                    "icon-image": [
                        "step",
                        ["zoom"],
                        [
                            "case",
                            ["==", ["get", "capital"], 2],
                            "border-dot-13",
                            [
                                "step",
                                ["get", "symbolrank"],
                                "dot-11",
                                9,
                                "dot-10",
                                11,
                                "dot-9"
                            ]
                        ],
                        8,
                        ""
                    ],
                    "text-font": ["Manrope Regular", "Arial Unicode MS Regular"],
                    "text-justify": "auto",
                    "text-anchor": [
                        "step",
                        ["zoom"],
                        ["get", "text_anchor"],
                        8,
                        "center"
                    ],
                    "text-field": ["coalesce", ["get", "name_en"], ["get", "name"]],
                    "text-max-width": 7
                },
                "paint": {
                    "text-color": "hsl(0, 0%, 95%)",
                    "text-halo-color": "hsl(0, 5%, 0%)",
                    "text-halo-width": 1,
                    "text-halo-blur": 1
                }
            },
            {
                "id": "settlement-major-label",
                "type": "symbol",
                "metadata": {
                    "mapbox:featureComponent": "place-labels",
                    "mapbox:group": "Place labels, place-labels"
                },
                "source": "composite",
                "source-layer": "place_label",
                "minzoom": 2,
                "maxzoom": 15,
                "filter": [
                    "all",
                    ["<=", ["get", "filterrank"], 3],
                    [
                        "match",
                        ["get", "class"],
                        ["settlement", "disputed_settlement"],
                        ["match", ["get", "worldview"], ["all", "US"], true, false],
                        false
                    ],
                    [
                        "step",
                        ["zoom"],
                        false,
                        2,
                        ["<=", ["get", "symbolrank"], 6],
                        4,
                        ["<", ["get", "symbolrank"], 7],
                        6,
                        ["<", ["get", "symbolrank"], 8],
                        7,
                        ["<", ["get", "symbolrank"], 10],
                        10,
                        ["<", ["get", "symbolrank"], 11],
                        11,
                        ["<", ["get", "symbolrank"], 13],
                        12,
                        ["<", ["get", "symbolrank"], 15],
                        13,
                        [">=", ["get", "symbolrank"], 11],
                        14,
                        [">=", ["get", "symbolrank"], 15]
                    ],
                    [
                        "step",
                        ["pitch"],
                        true,
                        50,
                        ["<", ["distance-from-center"], 3],
                        60,
                        ["<", ["distance-from-center"], 4],
                        70,
                        ["<", ["distance-from-center"], 5]
                    ]
                ],
                "layout": {
                    "text-line-height": 1.1,
                    "text-size": [
                        "interpolate",
                        ["cubic-bezier", 0.2, 0, 0.9, 1],
                        ["zoom"],
                        3,
                        [
                            "step",
                            ["get", "symbolrank"],
                            14.3,
                            6,
                            12.100000000000001
                        ],
                        6,
                        [
                            "step",
                            ["get", "symbolrank"],
                            19.8,
                            6,
                            17.6,
                            7,
                            15.400000000000002
                        ],
                        8,
                        [
                            "step",
                            ["get", "symbolrank"],
                            22,
                            9,
                            17.6,
                            10,
                            15.400000000000002
                        ],
                        15,
                        [
                            "step",
                            ["get", "symbolrank"],
                            26.400000000000002,
                            9,
                            22,
                            12,
                            17.6,
                            15,
                            15.400000000000002
                        ]
                    ],
                    "text-radial-offset": [
                        "step",
                        ["zoom"],
                        ["match", ["get", "capital"], 2, 0.6, 0.55],
                        8,
                        0
                    ],
                    "symbol-sort-key": ["get", "symbolrank"],
                    "icon-image": [
                        "step",
                        ["zoom"],
                        [
                            "case",
                            ["==", ["get", "capital"], 2],
                            "border-dot-13",
                            [
                                "step",
                                ["get", "symbolrank"],
                                "dot-11",
                                9,
                                "dot-10",
                                11,
                                "dot-9"
                            ]
                        ],
                        8,
                        ""
                    ],
                    "text-font": ["Manrope Medium", "Arial Unicode MS Regular"],
                    "text-justify": [
                        "step",
                        ["zoom"],
                        [
                            "match",
                            ["get", "text_anchor"],
                            ["left", "bottom-left", "top-left"],
                            "left",
                            ["right", "bottom-right", "top-right"],
                            "right",
                            "center"
                        ],
                        8,
                        "center"
                    ],
                    "text-anchor": [
                        "step",
                        ["zoom"],
                        ["get", "text_anchor"],
                        8,
                        "center"
                    ],
                    "text-field": ["coalesce", ["get", "name_en"], ["get", "name"]],
                    "text-max-width": 7
                },
                "paint": {
                    "text-color": "hsl(0, 0%, 95%)",
                    "text-halo-color": "hsl(0, 5%, 0%)",
                    "text-halo-width": 1,
                    "text-halo-blur": 1
                }
            },
            {
                "id": "state-label",
                "type": "symbol",
                "metadata": {
                    "mapbox:featureComponent": "place-labels",
                    "mapbox:group": "Place labels, place-labels"
                },
                "source": "composite",
                "source-layer": "place_label",
                "minzoom": 3,
                "maxzoom": 9,
                "filter": [
                    "all",
                    [
                        "match",
                        ["get", "class"],
                        ["state", "disputed_state"],
                        ["match", ["get", "worldview"], ["all", "US"], true, false],
                        false
                    ],
                    [
                        "step",
                        ["pitch"],
                        true,
                        50,
                        ["<", ["distance-from-center"], 3],
                        60,
                        ["<", ["distance-from-center"], 4],
                        70,
                        ["<", ["distance-from-center"], 5]
                    ]
                ],
                "layout": {
                    "text-size": [
                        "interpolate",
                        ["cubic-bezier", 0.85, 0.7, 0.65, 1],
                        ["zoom"],
                        4,
                        [
                            "step",
                            ["get", "symbolrank"],
                            9.9,
                            6,
                            8.8,
                            7,
                            7.700000000000001
                        ],
                        9,
                        [
                            "step",
                            ["get", "symbolrank"],
                            23.1,
                            6,
                            17.6,
                            7,
                            15.400000000000002
                        ]
                    ],
                    "text-transform": "uppercase",
                    "text-font": ["Manrope Bold", "Arial Unicode MS Bold"],
                    "text-field": ["coalesce", ["get", "name_en"], ["get", "name"]],
                    "text-letter-spacing": 0.15,
                    "text-max-width": 6
                },
                "paint": {
                    "text-color": "hsl(0, 0%, 95%)",
                    "text-halo-color": "hsl(0, 5%, 0%)",
                    "text-halo-width": 1,
                    "text-opacity": 0.5
                }
            },
            {
                "id": "country-label",
                "type": "symbol",
                "metadata": {
                    "mapbox:featureComponent": "place-labels",
                    "mapbox:group": "Place labels, place-labels"
                },
                "source": "composite",
                "source-layer": "place_label",
                "minzoom": 1,
                "maxzoom": 10,
                "filter": [
                    "all",
                    [
                        "match",
                        ["get", "class"],
                        ["country", "disputed_country"],
                        ["match", ["get", "worldview"], ["all", "US"], true, false],
                        false
                    ],
                    [
                        "step",
                        ["pitch"],
                        true,
                        50,
                        ["<", ["distance-from-center"], 3],
                        60,
                        ["<", ["distance-from-center"], 4],
                        70,
                        ["<", ["distance-from-center"], 5]
                    ]
                ],
                "layout": {
                    "icon-image": "",
                    "text-field": ["coalesce", ["get", "name_en"], ["get", "name"]],
                    "text-line-height": 1.1,
                    "text-max-width": 6,
                    "text-font": ["Manrope Medium", "Arial Unicode MS Regular"],
                    "text-radial-offset": ["step", ["zoom"], 0.6, 8, 0],
                    "text-justify": [
                        "step",
                        ["zoom"],
                        [
                            "match",
                            ["get", "text_anchor"],
                            ["left", "bottom-left", "top-left"],
                            "left",
                            ["right", "bottom-right", "top-right"],
                            "right",
                            "center"
                        ],
                        7,
                        "auto"
                    ],
                    "text-size": [
                        "interpolate",
                        ["cubic-bezier", 0.2, 0, 0.7, 1],
                        ["zoom"],
                        1,
                        [
                            "step",
                            ["get", "symbolrank"],
                            12.100000000000001,
                            4,
                            9.9,
                            5,
                            8.8
                        ],
                        9,
                        [
                            "step",
                            ["get", "symbolrank"],
                            24.200000000000003,
                            4,
                            20.900000000000002,
                            5,
                            18.700000000000003
                        ]
                    ]
                },
                "paint": {
                    "icon-opacity": [
                        "step",
                        ["zoom"],
                        ["case", ["has", "text_anchor"], 1, 0],
                        7,
                        0
                    ],
                    "text-color": "hsl(0, 0%, 95%)",
                    "text-halo-color": [
                        "interpolate",
                        ["linear"],
                        ["zoom"],
                        2,
                        "hsla(0, 5%, 0%, 0.75)",
                        3,
                        "hsl(0, 5%, 0%)"
                    ],
                    "text-halo-width": 1.25
                }
            },
            {
                "id": "continent-label",
                "type": "symbol",
                "metadata": {
                    "mapbox:featureComponent": "place-labels",
                    "mapbox:group": "Place labels, place-labels"
                },
                "source": "composite",
                "source-layer": "natural_label",
                "minzoom": 0.75,
                "maxzoom": 3,
                "filter": ["==", ["get", "class"], "continent"],
                "layout": {
                    "text-field": ["coalesce", ["get", "name_en"], ["get", "name"]],
                    "text-line-height": 1.1,
                    "text-max-width": 6,
                    "text-font": ["Manrope Medium", "Arial Unicode MS Regular"],
                    "text-size": [
                        "interpolate",
                        ["exponential", 0.5],
                        ["zoom"],
                        0,
                        11,
                        2.5,
                        16.5
                    ],
                    "text-transform": "uppercase",
                    "text-letter-spacing": 0.05
                },
                "paint": {
                    "text-color": "hsl(0, 0%, 95%)",
                    "text-halo-color": [
                        "interpolate",
                        ["linear"],
                        ["zoom"],
                        0,
                        "hsla(0, 5%, 0%, 0.75)",
                        3,
                        "hsl(0, 5%, 0%)"
                    ],
                    "text-halo-width": 1.5,
                    "text-opacity": [
                        "interpolate",
                        ["linear"],
                        ["zoom"],
                        0,
                        0.8,
                        1.5,
                        0.5,
                        2.5,
                        0
                    ]
                }
            }
        ],
        "created": "2024-01-16T06:28:08.936Z",
        "modified": "2024-01-16T06:28:11.217Z",
        "id": "clrfz30iw005401rdb6rp11tt",
        "owner": "vtremsin",
        "visibility": "private",
        "protected": false,
        "draft": false
    }
    """
    
}
