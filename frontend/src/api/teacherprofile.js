import {
    requestPatch
} from './request'

export function teacherprofilePatch(id, data) {
    return requestPatch(`/users/api/teacherprofile/`, id, data)
}