run_server:
	cd spectra_server && dart bin/main.dart --apply-migrations

run_server_repair:
	cd spectra_server && dart run bin/main.dart --apply-repair-migration

generate:
	cd spectra_server && serverpod generate

repair:
	cd spectra_server && $ serverpod create-repair-migration

repair_force:
	cd spectra_server && $ serverpod create-repair-migration --force

compose:
	cd spectra_server && docker compose up --build --detach

migrate_force:
	cd spectra_server && serverpod create-migration --force

migrate:
	cd spectra_server && serverpod create-migration

connect_adb:
	adb connect 10.236.45.60

run_app:
	cd spectra_flutter && flutter run

build:
	cd spectra_flutter && dart run build_runner build --delete-conflicting-outputs

