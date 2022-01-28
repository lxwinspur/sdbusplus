#pragma once

#include <cerrno>
#include <sdbusplus/exception.hpp>
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
struct ${e.name} final :
        public sdbusplus::exception::generated_exception
{
    static constexpr auto errName = "${event.name}.Event.${e.name}";
    static constexpr auto errDesc =
            "${e.description.strip()}";
    static constexpr auto errWhat =
            "${event.name}.Event.${e.name}: ${e.description.strip()}";
    % if e.errno:
    static constexpr auto errErrno = ${e.errno};
    % endif

    const char* name() const noexcept override;
    const char* description() const noexcept override;
    const char* what() const noexcept override;
    % if e.errno:
    int get_errno() const noexcept override;
    % endif
};

    % endfor
} // namespace Event
    % for s in reversed(namespaces):
} // namespace ${s}
    % endfor
} // namespace sdbusplus
