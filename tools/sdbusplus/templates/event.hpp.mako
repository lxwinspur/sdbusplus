#pragma once

#include <sdbusplus/event.hpp>
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
struct ${e.name} final : public sdbusplus::events::events
{
    static constexpr auto eventName = "${event.name}.Event.${e.name}";
    static constexpr auto eventDesc =
            "${e.description.strip()}";
    static constexpr auto eventConsumer =
            "${e.consumer.strip()}";

    const char* name() const noexcept override;
    const char* description() const noexcept override;
    const char* consumer() const noexcept override;

};

    % endfor
} // namespace Event
    % for s in reversed(namespaces):
} // namespace ${s}
    % endfor
} // namespace sdbusplus
