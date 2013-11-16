from django.conf.urls import patterns, include, url
from redpepp.views import *

from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
	url(r'^static/(?P<path>.*)$', 'django.views.static.serve', {'document_root': settings.STATIC_ROOT, 'show_indexes': False}),
	url(r'^media/(?P<path>.*)$', 'django.views.static.serve', {'document_root': settings.MEDIA_ROOT, 'show_indexes': False}),
    url(r'^admin/doc/', include('django.contrib.admindocs.urls')),
    url(r'^admin/', include(admin.site.urls)),
    url(r'^$', 'redpepp.views.index', name='mainpage'),
    url(r'^project/(\d+)/$', 'redpepp.views.project', name='redpepp.project'),
)

urlpatterns += patterns('django.contrib.flatpages.views',
    (r'^(?P<url>.*)$', 'flatpage'),
)
