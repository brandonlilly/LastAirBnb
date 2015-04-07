# LastAirBnb

[Heroku link][heroku]

[heroku]: http://lastairbnb.herokuapp.com

## Minimum Viable Product
LastAirBnb is an [Avatar][avatarwiki] themed AirBnb clone built with Rails and Backbone. Users
are able to:

- [ ] Create accounts
- [ ] Log in/out
- [ ] View listings
- [ ] Review listings
- [ ] List places
- [ ] Book listings
- [ ] Search for listings

[avatarwiki]: http://en.wikipedia.org/wiki/Avatar:_The_Last_Airbender

## Design Docs
<!-- * [View Wireframes][views] -->
* [DB schema][schema]

<!-- [views]: ./docs/views.md -->
[schema]: ./docs/schema.md

TODO: Take pictures of and upload my view wireframe sketches.

## Implementation Timeline

### Phase 1: User Authentication (~1 day)
Implement user authentication. By the end of phase, users will be able to sign
up, log in, and view rooms. I will allow multiple session login from the start
because its no more complex to implement than single session login. Create heroku
app for production.

### Phase 2: Listing Show Page (~1.5 days)
Set up listings, amenities, and listing_amenties tables and associations. Seed
a few listings, and amenities. Layout and style show page with listing information
and photos.

### Phase 3: Listing Photos and Reviews (~1 day)
Set up photos and review tables and associations. Seed a few reviews and photos
for listings. Add review index and form to listing show page. Add average rating
for listings.

### Phase 4: List Your Space (1.5 days)
Allow users to create new listings and upload photos in new listing page.

### Phase 5: Reservations (2 days)
Add ReservationForm view to ListingShow page. Allow users to specify check in date
and check out date and request a reservation. Create ReservationIndex for users
to see their reservation statuses. Allow listing owners to approve or deny listings.

### Phase 6: Listings Index and Search (2 days)
Implement ListingsIndex with a Search function to allow users to narrow the
listings by listing title and location.

### Bonus Features (TBD)
- [ ] Specify cover photo
- [ ] Users can list rooms
- [ ] Map with listing location pin
- [ ] Video background in welcome page
- [ ] Vanity urls with listing names
- [ ] Vanity login urls
- [ ] User avatars
- [ ] Typeahead search bar
- [ ] Walkthrough guide
- [ ] Custom logo
- [ ] User profiles/dashboard
- [ ] Reviewing listing owners


[phase-one]: ./docs/phases/phase1.md
[phase-two]: ./docs/phases/phase2.md
[phase-three]: ./docs/phases/phase3.md
[phase-four]: ./docs/phases/phase4.md
[phase-five]: ./docs/phases/phase5.md
