# wp-docker

## Notes 

Wordpress install goes in /html

See docker-compose.yaml for database settings.

Change example access keys if you ate testing WooCommerce.

Read the comments in docker-compose.yaml and Docker for other important setup info. 

## WooCommerce rest api example 

    <script>
    
        console.log('2 ways of fetching products from WooCommerce REST API...');

        // Consumer key and secret in the URL parameters (less secure)
        fetch ('https://localhost/wp-json/wc/v3/products?consumer_key=ck_417c5972d2dd7f5e972f680410949e1993b32eaf&consumer_secret=cs_0ac90608698e9033d62085329e68f68ba8aa920e')
        .then(response => response.json())
        .then(data => console.log(data))
        .catch(error => console.error('Error fetching products:', error));

        // In the headers (basic auth with base64 encoded key) (more secure)
        fetch ('https://localhost/wp-json/wc/v3/products', {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json',
                'Authorization': 'Basic Y2tfNDE3YzU5NzJkMmRkN2Y1ZTk3MmY2ODA0MTA5NDllMTk5M2IzMmVhZjpjc18wYWM5MDYwODY5OGU5MDMzZDYyMDg1MzI5ZTY4ZjY4YmE4YWE5MjBl'
            }
        })
        .then(response => response.json())
        .then(data => console.log(data))
        .catch(error => console.error('Error fetching products:', error));

    </script>