/* C++ code produced by gperf version 3.0.3 */
/* Command-line: /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/gperf -L C++ -E -t /private/var/folders/53/3pj2hcvx59b461j7q8tgfs600000gn/T/jayy/appsflyer-generated/KrollGeneratedBindings.gperf  */
/* Computed positions: -k'' */

#line 3 "/private/var/folders/53/3pj2hcvx59b461j7q8tgfs600000gn/T/jayy/appsflyer-generated/KrollGeneratedBindings.gperf"


#include <string.h>
#include <v8.h>
#include <KrollBindings.h>

#include "co.uk.devpulse.appsflyer.AppsFlyerModule.h"
#include "co.uk.devpulse.appsflyer.ExampleProxy.h"


#line 14 "/private/var/folders/53/3pj2hcvx59b461j7q8tgfs600000gn/T/jayy/appsflyer-generated/KrollGeneratedBindings.gperf"
struct titanium::bindings::BindEntry;
/* maximum key range = 4, duplicates = 0 */

class AppsFlyerBindings
{
private:
  static inline unsigned int hash (const char *str, unsigned int len);
public:
  static struct titanium::bindings::BindEntry *lookupGeneratedInit (const char *str, unsigned int len);
};

inline /*ARGSUSED*/
unsigned int
AppsFlyerBindings::hash (register const char *str, register unsigned int len)
{
  return len;
}

struct titanium::bindings::BindEntry *
AppsFlyerBindings::lookupGeneratedInit (register const char *str, register unsigned int len)
{
  enum
    {
      TOTAL_KEYWORDS = 2,
      MIN_WORD_LENGTH = 37,
      MAX_WORD_LENGTH = 40,
      MIN_HASH_VALUE = 37,
      MAX_HASH_VALUE = 40
    };

  static struct titanium::bindings::BindEntry wordlist[] =
    {
      {""}, {""}, {""}, {""}, {""}, {""}, {""}, {""}, {""},
      {""}, {""}, {""}, {""}, {""}, {""}, {""}, {""}, {""},
      {""}, {""}, {""}, {""}, {""}, {""}, {""}, {""}, {""},
      {""}, {""}, {""}, {""}, {""}, {""}, {""}, {""}, {""},
      {""},
#line 17 "/private/var/folders/53/3pj2hcvx59b461j7q8tgfs600000gn/T/jayy/appsflyer-generated/KrollGeneratedBindings.gperf"
      {"co.uk.devpulse.appsflyer.ExampleProxy", ::co::uk::devpulse::appsflyer::appsflyer::ExampleProxy::bindProxy, ::co::uk::devpulse::appsflyer::appsflyer::ExampleProxy::dispose},
      {""}, {""},
#line 16 "/private/var/folders/53/3pj2hcvx59b461j7q8tgfs600000gn/T/jayy/appsflyer-generated/KrollGeneratedBindings.gperf"
      {"co.uk.devpulse.appsflyer.AppsFlyerModule", ::co::uk::devpulse::appsflyer::AppsFlyerModule::bindProxy, ::co::uk::devpulse::appsflyer::AppsFlyerModule::dispose}
    };

  if (len <= MAX_WORD_LENGTH && len >= MIN_WORD_LENGTH)
    {
      unsigned int key = hash (str, len);

      if (key <= MAX_HASH_VALUE)
        {
          register const char *s = wordlist[key].name;

          if (*str == *s && !strcmp (str + 1, s + 1))
            return &wordlist[key];
        }
    }
  return 0;
}
#line 18 "/private/var/folders/53/3pj2hcvx59b461j7q8tgfs600000gn/T/jayy/appsflyer-generated/KrollGeneratedBindings.gperf"

