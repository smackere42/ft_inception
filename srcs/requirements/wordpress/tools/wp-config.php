<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', ${WORDPRESS_DB_NAME} );

/** MySQL database username */
define( 'DB_USER', ${WORDPRESS_DB_USER} );

/** MySQL database password */
define( 'DB_PASSWORD', ${WORDPRESS_DB_PASSWORD} );

/** MySQL hostname */
define( 'DB_HOST', ${WORDPRESS_DB_HOST} );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '${FJJFFu)jWo#f #3HeFZDB7 Vb (a%OI:pjL!#0=yY<bS^gC3K3ZVstm[*~UrgJ');
define('SECURE_AUTH_KEY',  '_EI+q)y0+65P.*[8y_*!Wh56e(J/UG~_`x8b^^ XJ/B+&r-0}F <^[+g 4yV09J$');
define('LOGGED_IN_KEY',    ',Nv|I=ec(|sHC&]7*z)BJX&v|xC0IG.M{G%hAt-_L|ydLxftYNxQC-Pn7)3lyTAZ');
define('NONCE_KEY',        ':To?Gl|Tio&Rm&:D(d9-%++wRr^VVL7qK+T4a^hHNH#eg.GRh5WiW/T]/Z<:aR:E');
define('AUTH_SALT',        '4O5$fi*+f)Eun:@0IBV9z>)/ygv.CjhQeR=J<B0o<+zHV#|zzH+u6^xk6DW;Xce#');
define('SECURE_AUTH_SALT', 'pZ|~UD^t3 g@qvGdqT($RgnF(`ss+j#>B(uNZ[fVaNU0A-7jRfM}/B++<#&TD%Hu');
define('LOGGED_IN_SALT',   'H%t0L 8>gXF+b*EnO:DId0D}Ue>xS9{M1duP2E4F*`E<3fn1T<@$e _*]Z)<[>rQ');
define('NONCE_SALT',       '%qwkY?4k>cQXnCg^IvJ_WgFE|7QVf;|o{@]T1!Z|9KQ<^Ki5Fl:Y3Pzki2y$h<yM');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

 /* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';