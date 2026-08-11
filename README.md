# radiant-beauty
An e-commerce platform that sells skincare products like cleansers, moisturizers, serums, sunscreens, etc. to customers.

## Main Functionality
### Customer 
- Normal app user functions like create account, login, forgot password, etc.  
- Browses skincare products. 
- Adds products to the shopping cart. 
- Places and tracks orders. 
- Writes product reviews.
### Administrator 
-  Manages products.
-  Updates prices and stock levels.
- Processes customer orders.
- Manages customer accounts.
-  Generates sales reports.

## Deadlines
### Week 1 (Saturday 15/07/2026)
- [ ] Register screen with these functionalities:
      - Register an account with these details: Name, Surname, Gender, DOB, Race, Phone number
      - Verify password
      - Cannot use pre-existing email/phone number
      - Verify email before successful account registration? (maybe add this to later deadlines)
- [ ] Login screen with these functionalities:
      - Login by email/phone number
      - Login as administrator
      - "Forgot Password" Hypertext link to forgot password screen
      - "Don't have an account yet? Register" hypertext link to the register screen
- [ ] Forgot password screen with these functionalities:
      - Use email only to locate account
      - Use phone number to locate account but the reset password code will still only be sent to the email
      - Get the reset password link
      - The actual functionality will be added in later deadlines, just a 'useless' screen for now
- [ ] Profile screen with these functionalities:
      - Show account details.
      - Change email/phone number, password or any other details.
      - Add shipping and/or billing address.
- [ ] Add the main administrator directly from the SQL queries.
- [ ] Add a (empty?) home page screen that will be directed to by a successful login.
