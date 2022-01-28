#pragma once

#include <systemd/sd-bus.h>

#include <sdbusplus/sdbus.hpp>

#include <string>

namespace sdbusplus
{

namespace events
{

/** Base exception class for all sdbusplus exceptions, including those created
 *  by the bindings. */
struct events
{
    virtual const char* name() const noexcept = 0;
    virtual const char* description() const noexcept = 0;

  private:
    // This unused function is to ensure that the vtable for this class is
    // properly emitted when `-flto=auto` is used, which is the default in
    // Yocto builds.  Without this, the vtable is a hidden symbol and no
    // users can inherit from our exception type directly.
    virtual void unused() const noexcept;
};

} // namespace events
} // namespace sdbusplus
