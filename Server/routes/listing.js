// All the routes here are invalid. Listings are supposed to be rendered for different restaurants individually. (Check the Figma design) 

const express = require("express");
const router = express.Router();
const wrapAsync = require("../utils/wrapAsync");
const {isLoggedIn, isOwner, validateListing } = require("../middleware.js");
const listingController = require("../controllers/listings.js");
const multer = require("multer");
const {storage} = require("../cloudConfig.js");
const upload = multer({storage});

// router
//     .route("/")  // Listings won't be rendered on root route check the Figma design
//     .get(wrapAsync(listingController.showAllListings))
//     .post(
//         isLoggedIn,  
//         upload.single("listing[image]"),
//         validateListing,
//         wrapAsync(listingController.createListing)
//     )

router.get(
    "/new", 
    isLoggedIn, 
    listingController.newListingForm
);

router
    .route("/:id")
    .get(wrapAsync(listingController.showListingDetails))
    .put(
        isLoggedIn, 
        isOwner, 
        upload.single("listing[image]"),
        validateListing, 
        wrapAsync(listingController.updateListing)
    )
    .delete(
        isLoggedIn, 
        isOwner, 
        wrapAsync(listingController.deleteListing)
    )

router.get(
    "/:id/edit", 
    isLoggedIn, 
    isOwner, 
    wrapAsync(listingController.editListingForm)
);

module.exports = router;
