/*
 * Copyright (c) 2021, WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package org.wso2.carbon.is.migration.util;

/**
 * App portal enum class.
 */
public enum AppPortal {

    USER_PORTAL("User Portal", "This is the user portal application.", "USER_PORTAL", "/user-portal/login"),
    ADMIN_PORTAL("Admin Portal", "This is the admin portal application.", "ADMIN_PORTAL", "/admin-portal/login");

    private final String name;
    private final String description;
    private final String consumerKey;
    private final String path;

    private AppPortal(String name, String description, String consumerKey, String path) {
        this.name = name;
        this.description = description;
        this.consumerKey = consumerKey;
        this.path = path;
    }

    public String getName() {
        return this.name;
    }

    public String getDescription() {
        return this.description;
    }

    public String getConsumerKey() {
        return this.consumerKey;
    }

    public String getPath() {
        return this.path;
    }
}
