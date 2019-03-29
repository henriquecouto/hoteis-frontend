<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />

  <title>
    HotelTop
  </title>
  <link rel="shortcut icon" type="image/png" href="/static/logo" />
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css"
    integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
  <style>
    .mytd {
      width: 100px;
    }

    .mytd .diarias {
      display: none;
    }

    .mytd:hover .diarias {
      display: block;
    }

    .mytd:hover .saida {
      display: none
    }

    .overlay {
      position: fixed;
      top: 0;
      bottom: 0;
      left: 0;
      right: 0;
      background: rgba(0, 0, 0, 0.7);
      visibility: hidden;
      opacity: 0;
    }

    .overlay:target {
      visibility: visible;
      opacity: 1;
    }

    .popup {
      margin: 70px auto;
      background: #fff;
      border-radius: 5px;
      width: 30%;
      position: relative;
    }

    .popup h2 {
      margin-top: 0;
      color: #333;
      font-family: Tahoma, Arial, sans-serif;
    }

    .popup .close {
      position: absolute;
      top: 20px;
      right: 30px;
      font-size: 30px;
      font-weight: bold;
      text-decoration: none;
      color: #333;
    }

    .popup .close:hover {
      color: #007BFF;
    }

    .popup .content {
      max-height: 30%;
      overflow: auto;
    }

    @media screen and (max-width: 700px) {
      .popup {
        width: 70%;
      }
    }
  </style>
</head>