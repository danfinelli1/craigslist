- you did not provide a README.md file

- you have a LOT of migrations.  You can drop your database and rebuild your main models with the additions you added later on.  21 migrations is too much.  Keep it to main models &  associations only.

- rename your join table to either `events_users` or `attending` or some other useful description word.  `jointable` is too abstract

- Optional: consider extracting your seed data into an external file (maybe in json?) and iterating over it cleanly in your seed.rb file.  All I see is a wall of text

- rake db:setup fails

```bash
rake aborted!
ActiveRecord::InvalidForeignKey: PG::ForeignKeyViolation: ERROR:  insert or update on table "events" violates foreign key constraint "fk_rails_0cb5590091"
DETAIL:  Key (user_id)=(2) is not present in table "users".
: INSERT INTO "events" ("title", "body", "category", "price", "address", "date", "created_at", "updated_at", "user_id", "zipcode") VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10) RETURNING "id"
```

- Consider adding a quick description of what your site provides re: service.  

- Your Sign up view could use some extra styling to make it look more than just the standard code for logging in.

- NoMethodError in Users#show error when I sign up with a new user. (This completely bricks the server). Even after deleting my local session ID I am not able to login afterwards

- You are hot-linking like crazy a person's image over and over and over and over and over and over again. Either download it, put it in an `img/` folder and link to it or make your own. You should NOT be linking to an external image or any other non publicly offered media.

- Don't make db calls in your views.  That is very bad.

- You have complex controller methods.  Make sure to add comments to make it easier to understand.
