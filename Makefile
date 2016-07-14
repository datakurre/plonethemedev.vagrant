all: build

up:
	mkdir -p resources/theme
	vagrant up
	vagrant ssh -c "./runbin.sh buildout -Nc \
	  /vagrant/buildout.cfg buildout:directory=/home/vagrant/Plone/zinstance"

build: up
	./plonectl.sh start; \
	  make -C resources build; \
	  status=$$?; \
	  ./plonectl.sh stop; \
	  exit $$status

watch: up
	make -j watch_plone watch_rsync watch_theme

watch_rsync:
	vagrant rsync-auto

watch_plone:
	./plonectl.sh fg

watch_theme:
	sleep 10  # wait for Plone
	make -C resources watch

clean:
	vagrant halt -f
	make -C resources clean
	$(RM) kill_plone.sh plonectl.sh buildout.sh vagrant_scp.sh
	$(RM) -r plone

.PHONY: all up build clean watch watch_plone watch_theme
