# STORY:

You have been approached by a client who would like to display photographs of cat tee-shirts on their website.

For Version #1, these photos should be available to anyone who has the URLs.

## REQUIREMENTS:

  1. They would like a user to be able to navigate to a specific URL and see the image specified in the URL image displayed in the html rendered on the page.

  2. They would also like a user to be able to navigate to a URL that shows a random image (out of their set) displayed in the html rendered on the page.

Secondly, they would like a JSON API that exposes the two endpoints.

The JSON for each endpoint would do the following:

  * Endpoint #1 returns the filename and the fully qualified URL for a specific image, e.g.
    {
      filename: "foo.jpg",
      url: "http... foo.jpg"
    }

  * Endpoint #2 returns the filename and the fully qualified URL for a random image
    {
      filename: "foo.jpg",
      url: "http... foo.jpg"
    }

## MATERIALS

  * The client has a directory of 4 photographs that they would like to use as a start. The directory of photographs is included.
