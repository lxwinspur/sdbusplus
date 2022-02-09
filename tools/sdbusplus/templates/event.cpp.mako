#include <${ '/'.join(event.name.split('.')) }/event.hpp>
<% namespaces = event.name.split('.') %>
namespace sdbusplus
{
    % for s in namespaces:
namespace ${s}
{
    % endfor
namespace Event
{
    % for e in event.events:
const char* ${e.name}::name() const noexcept
{
    return eventName;
}
const char* ${e.name}::description() const noexcept
{
    return eventDesc;
}
const char* ${e.name}::consumer() const noexcept
{
    return eventConsumer;
}
    % endfor

} // namespace Event
    % for s in reversed(namespaces):
} // namespace ${s}
    % endfor
} // namespace sdbusplus
