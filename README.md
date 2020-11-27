# QikServe Engineer Technical Test

Pedro Dousseau, pedro@dousseau.com

The challenge is to build a checkout system for a local supermarket. Think about how the solution would be used to calculate the total
cost of a basket which could contain any combination of items and promotions.

- Items can be scanned in any order.
- Promotions should always be applied if possible.
- The supermarket owner would like to show the customer how much they've saved.
- New types of prices/promotions may need to be added in the future.

There is a WireMock server with a few API mappings to retrieve production information for the application.

## How To Run

The solution is built on top of Ruby on Rails and is setup to run with docker.
**The following script must be executed from the project root path!**

Setup the container. This can take a while for the first time:

```
$ ./docker/build.sh
```

Run the application along with WireMock:

```
$ ./docker/server.sh
```

Run all unit tests (the code is in /test/models/):

```
$ ./docker/test.sh
```

Run bash inside the container for development:

```
$ ./docker/bash.sh
```

## Follow-up Questions

**How long did you spend on the test?**

I don't know exactly. It took split intervals along almost 24h. It would be close to 7 hours.

**What would you add if you had more time?**

I would add more tests, like testing the controllers and user interface tests with Capybara. I also would like to make the models more
robust, adding more verifications. And I would try to bring more cart code from the controller to the model, trying to leave the controller
with less code as possible (but the cart depends on session, so I don't if it is worth to bring everything to the model, I have to think
more). I also would review and refactor the unit tests, probably they are missing something.

**How would you improve the product APIs that you had to consume?**

For sure I would add a promotion endpoint to list all the promotions available. Also it would be cool to list products by type of
promotion. I also would add some filtering and ordering on the product listing.

**What did you find most difficult?**

The most difficult part was to manage session code vs cart code. Add the same item multiple types without making it too complex to manage
on the session and bring the complexity to the cart model. So inside the cart I manage to join the quantities of products that were added
multiple times.

**How did you find the overall experience, any feedback for us?**

I like it. Problem solving with "real world" problems. I among all the ones that I took the past week, these one was one of the best.
