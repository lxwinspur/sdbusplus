import os
import yaml
from .namedelement import NamedElement
from .renderer import Renderer

class Event(NamedElement, Renderer):
    @staticmethod
    def load(name, rootdir="."):
        filename = os.path.join(
            rootdir, name.replace(".", "/") + ".events.yaml"
        )

        with open(filename) as f:
            data = f.read()
            y = yaml.safe_load(data)
            y = {"name": name, "events": y}
            return Event(**y)

    def __init__(self, **kwargs):
        self.events = kwargs.pop('events', None)

        super(Event, self).__init__(**kwargs)

    def markdown(self, loader):
        return self.render(loader, "event.md.mako", event=self)

    def event_header(self, loader):
        return self.render(loader, "event.hpp.mako", event=self)

    def event_cpp(self, loader):
        return self.render(loader, "event.cpp.mako", event=self)
