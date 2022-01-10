# e_commerce_buyer

## Problem Statement

An e-commerce app that we can modify according to our client’s needs so that they can serve their customer.

## Few Clarifications:

* We don't give the ability to modify, to the client.
* They give their requirements and we modify the base code and deliver the product
* We don’t handle transactions in the app
* When the buyer adds items to the cart and finally when proceeds to buy, we redirect them to the seller’s WhatsApp business account with a cart summary. The buyer-seller completes the transaction there.
* We don’t maintain any records for buyers
* We only maintain seller information and items listed.

## Functional Requirements [(What is a functional requirement) ](https://www.geeksforgeeks.org/functional-vs-non-functional-requirements/)

* Buyer’s App

  * Screen 1 (buyer info)

    * Screen for the buyer to enter own information
    * All the information are saved in [shared preference](https://www.geeksforgeeks.org/shared-preferences-in-android-with-examples/)
  * Screen 2 (items)

    * Seller’s items list
    * Search bar
    * Filters ( Category, Pricing )
    * Each listed item would have
      * Item’s title
      * Price
      * Category name
    * Add To Cart Option
    * Cart is a shared preference key-value pair where the key is the cart, value is the list of items
  * Screen 3 (cart)

    * Shows the Items added to the cart (from shared preferences)
    * Option to remove any item from the cart
    * When clicked on Buy Now, generates a summary of the cart items, redirects to the seller’s Whatsapp account
* Seller’s App

  * Screen 1 (seller info)
    * Screen for the buyer to enter own information
    * Enter items to be listed
    * Each listed item would have
      * Item’s title
      * Price
      * Category name
      * Images
    * All the info are saved in database
