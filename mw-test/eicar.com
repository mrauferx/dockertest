<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<title>404 - Not Found</title>

		<!-- Error page layout -->
		<style>

			html,
			body {
				height: 100%;
			}

			body {
				display:           -ms-flexbox;
				display:           -webkit-box;
				display:           flex;
				-ms-flex-align:    center;
				-ms-flex-pack:     center;
				-webkit-box-align: center;
				align-items:       center;
				-webkit-box-pack:  center;
				justify-content:   center;
				font-family:       sans-serif;
				font-size:         x-large;
				color:             #222222;
			}

			.error-wrapper {
				width:     100%;
				max-width: 25rem;
				padding:   15px;
				margin:    0 auto;
			}

			.error-code {
				background:    #f0f0f0;
				padding:       0.25rem 0.5rem;
				border-radius: 5px;
			}

			.wikipedia {
				margin-top: 1rem;
				font-size:  medium;
			}

			.wikipedia a {
				text-decoration: none;
				color:          #3278d5;
			}

			.wikipedia a[target="_blank"]:before {
				content: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAoAAAAKCAYAAACNMs+9AAAAQElEQVR42qXKwQkAIAxDUUdxtO6/RBQkQZvSi8I/pL4BoGw/XPkh4XigPmsUgh0626AjRsgxHTkUThsG2T/sIlzdTsp52kSS1wAAAABJRU5ErkJggg==);
				margin:  0 8px 0 0;
			}

		</style>

	</head>
	<body>
		<div class="error-wrapper">

			<h1>❗ Error <span class="error-code">404</span></h1>
			Not Found<br>
			<p class="wikipedia">
				<a href="https://en.wikipedia.org/wiki/List_of_HTTP_status_codes" target="_blank">more information on Wikipedia</a>
			</p>

			<br>
			<br>
			<br>

			<h1>❗ Fehler <span class="error-code">404</span></h1>
			Nicht gefunden<br>
			<p class="wikipedia">
				<a href="https://de.wikipedia.org/wiki/HTTP-Statuscode#Liste_der_HTTP-Statuscodes" target="_blank">mehr auf Wikipedia</a>
			</p>

		</div>

	</body>
</html>
