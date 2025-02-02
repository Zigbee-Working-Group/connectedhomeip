/*
 *   Copyright (c) 2021 Project CHIP Authors
 *   All rights reserved.
 *
 *   Licensed under the Apache License, Version 2.0 (the "License");
 *   you may not use this file except in compliance with the License.
 *   You may obtain a copy of the License at
 *
 *       http://www.apache.org/licenses/LICENSE-2.0
 *
 *   Unless required by applicable law or agreed to in writing, software
 *   distributed under the License is distributed on an "AS IS" BASIS,
 *   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *   See the License for the specific language governing permissions and
 *   limitations under the License.
 *
 */

#import <Matter/Matter.h>

#include "commands/common/Commands.h"
#include "commands/interactive/Commands.h"
#include "commands/pairing/Commands.h"
#include "commands/payload/Commands.h"
#include "commands/provider/Commands.h"
#include "commands/storage/Commands.h"

#include <zap-generated/cluster/Commands.h>
#include <zap-generated/test/Commands.h>

#include <cstdio>

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        MTRSetLogCallback(MTRLogTypeDetail, ^(MTRLogType type, NSString * component, NSString * message) {
            fprintf(stdout, "CHIP:%s: %s\n", component.UTF8String, message.UTF8String);
        });

        Commands commands;
        registerCommandsPairing(commands);
        registerCommandsInteractive(commands);
        registerCommandsPayload(commands);
        registerClusterOtaSoftwareUpdateProviderInteractive(commands);
        registerCommandsStorage(commands);
        registerCommandsTests(commands);
        registerClusters(commands);
        return commands.Run(argc, (char **) argv);
    }
}
