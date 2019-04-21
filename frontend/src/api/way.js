import {
    requestGetList
} from './request'


export function getWayList(params) {
    return requestGetList('/users/api/way/', params)
}