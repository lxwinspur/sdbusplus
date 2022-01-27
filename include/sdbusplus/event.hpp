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
};

} // namespace events
} // namespace sdbusplus
