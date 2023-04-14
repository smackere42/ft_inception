<?php
/** The name of the database for WordPress */
define('DB_NAME', ${WORDPRESS_DB_NAME});

/** MySQL database username */
define('DB_USER', ${WORDPRESS_DB_USER});

/** MySQL database password */
define('DB_PASSWORD', ${WORDPRESS_DB_PASSWORD});

/** MySQL hostname */
define('DB_HOST', ${WORDPRESS_DB_HOST});

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

define('AUTH_KEY',		'put your unique phrase here');
define('SECURE_AUTH_KEY',	'put your unique phrase here');
define('LOGGED_IN_KEY',		'put your unique phrase here');
define('NONCE_KEY',		'put your unique phrase here');
define('AUTH_SALT',		'put your unique phrase here');
define('SECURE_AUTH_SALT',	'put your unique phrase here');
define('LOGGED_IN_SALT',	'put your unique phrase here');
define('NONCE_SALT',		'put your unique phrase here');

$table_prefix  = 'wp_';

/* That's all, stop editing! Happy blogging. */