# WDI-DC-Project-3

## App Description
Vinyl.me gives vinyl collectors the features that come with streaming services such as Spotify. In the current version, users can create playlists of records that can be seen and browsed by all users.

## Technologies Used
- Ruby on Rails
- Javascript / jQuery
- Ajax
- Devise

## ERD
### Entities
- Users
- Playlists
- Records

### Relationships
- User has_many playlists, playlist belongs_to user
- Playlist has_many playlistrecords, has_many records through playlistrecords
- Record has_many playlistrecords, has_many playlists through playlistrecords

