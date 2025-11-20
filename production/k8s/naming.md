# Labels

1. ***`app`***

	Name of the top level application this object is a part of

	values:
	  - `blokmap`

1. ***`environment`***

	The deployment environment of this object

	values:
	  - `prod`
	  - `staging`
	  - `test`
	  - `dev`

1. ***`tier`***

	Part within the application this object is a part of

	values:
	  - `frontend`
	  - `backend`
	  - `auth`
	  - `static`

1. ***`component`***

	Specific type of component this object represents

	values:
	  - `application`
	  - `database`
	  - `cache`
	  - `volume`
	  - `secret`
	  - `config`
	  - `certificate`
	  - `ingress`

1. `related-to`

	Generic string for more details

# Examples

## Frontend static server

```yaml
metadata:
	labels:
		app: blokmap
		environment: prod
		tier: frontend
		component: application
```

## Backend process

```yaml
metadata:
	labels:
		app: blokmap
		environment: prod
		tier: backend
		component: application
```

## Backend database

```yaml
metadata:
	labels:
		app: blokmap
		environment: prod
		tier: backend
		component: database
```

## Backend database backing storage

```yaml
metadata:
	labels:
		app: blokmap
		environment: prod
		tier: backend
		component: volume
		related-to: database
```
